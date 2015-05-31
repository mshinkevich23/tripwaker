class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :correct_user?

  def edit
    @user = current_user
  end

  def edit_local
    @user = current_user
  end

  def update
    fields = [:place, :languages, :interests, :active_local, :day0, :day1, :day2, :day3, :day4, :day5, :day6]
    user = current_user
    fields.each do |field|
      val = params[:user][field].to_s
      user[field] = val unless val.blank?
    end
    user.save
    redirect_to root_url
  end
end
