class PagesController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:search, :email]
  before_filter :authenticate_user!, :only => [:search, :email]

  def home
  end

  def about
  end

  def email
  end

  def search
    date_start = Date.parse(params[:start_date])
    date_end = Date.parse(params[:end_date])
    start_time = Time.parse(params[:start_time])
    start_minutes = start_time.hour*60+start_time.min
    end_time = Time.parse(params[:end_time])
    end_minutes = end_time.hour*60+end_time.min
    interests = current_user.interests.to_s.split(',')
    languages = current_user.languages.to_s.split(',')

    intersect = Proc.new do |time1, time2|
      ans = []
      if (time1.second < time2.first || time2.second < time1.first)
        ans = []
      else 
        ans = [[time1.first, time2.first].max, [time1.second, time2.second].min]
      end
      ans
    end

    to_time = Proc.new do |minutes|
      time_h = ((minutes-minutes.modulo(60))/60).to_s
      time_m = minutes.modulo(60).to_s
      if (time_h.length == 1)
        time_h = "0"+time_h
      end
      if (time_m.length == 1)
        time_m = "0"+time_m
      end
      "#{time_h}:#{time_m}"
    end

    users = []
    User.where(:active_local => true, :place => params[:city]).each do |user|
      summary_time = 0
      date = date_start
      user = user.attributes
      user["dates"] = {}
      user_langs = user["languages"].to_s.split(',')
      inters = (user_langs & languages)
      if (inters.empty? || inters == [""])
        next
      end

      while date <= date_end do
        current_day = date.cwday-1
        user_times_today = user["day#{current_day}"].split(',').map{|e| e.to_i}
        current_times_today = []
        if (date == date_start && date == date_end)
          current_times_today = [start_minutes, end_minutes]
        elsif (date == date_start)
          current_times_today = [start_minutes, 1440]
        elsif (date == date_end)
          current_times_today = [0, end_minutes]
        else 
          current_times_today = [0, 1440]
        end
        range = intersect.call(current_times_today, user_times_today)
        if (range.any?)
          summary_time += range.second - range.first
          user["dates"][date.to_s] = "#{to_time.call(range.first)} - #{to_time.call(range.second)}"
        end
        date = date.next_day
      end
      user["summary_time"] = summary_time
      summary_time_h = (summary_time-summary_time.modulo(60))/60
      summary_time_m = summary_time.modulo(60)
      user["summary_time_ok"] = "#{summary_time_h} hours #{summary_time_m} minutes"
      user["languages"] = user_langs.select{|l| !l.blank? }.join(',')
      user["interests"] = user["interests"].split(',').select{|l| !l.blank?}.join(',')
      users << user
    end
    @users = users.sort_by{|u| u["summary_time"]}.reverse
  end
end
