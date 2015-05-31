class User < ActiveRecord::Base

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
         user.email = auth['info']['email'] || ""
         user.picture = auth['info']['image'] || ""
      end
      user.active_local = false
      user.day0 = "0,1440"
      user.day1 = "0,1440"
      user.day2 = "0,1440"
      user.day3 = "0,1440"
      user.day4 = "0,1440"
      user.day5 = "0,1440"
      user.day6 = "0,1440"
    end
  end
end




