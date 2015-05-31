# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

avatars = ['/assets/user_avatar.gif', '/assets/user_avatar.jpg']
users = ["Brandy Pierce", "Antonia Cannon", "Eunice	Alexander", "Jodi	Hodges", "Anne Logan", "Joani Ortiz", "Carlton Griffith", "Alberta Carter", "Flora Shaw", "Darren Watkins", "Marc Alvarez", "Gerald	Weaver", "Salvatore	Knight", "Cynthia	Fletcher", "Ross Martinez", "Melvin	Carpenter", "Shelley Medina", "Marcos	Hines", "Mildred Mccormick", "Jeffery Powell"]
cities = ["Moscow", "Berlin"]

interests = ["Photo", "Music", "Movies", "Sport", "Books", "Business", "Animals", "Food", "Science", "Art&Culture", "Entertainment"]
languages = ["Mandarin", "English", "Spanish", "Hindi", "Arabic", "French", "Indonesian and Malay", "Portuguese", "Bengali", "Russian", "Urdu"]

def day
 num1 = rand(1440)
 num2 = rand(1440)
 num1 -= num1.modulo(15)
 num2 -= num2.modulo(15)
 if (num1 > num2) 
   num1, num2 = num2, num1
 end
 return "#{num1},#{num2}"
end

users.each do |name|
  inter = [interests[0]]
  langu = [languages[1]]
  (1..5).each do 
    inter << interests.sample
    langu << languages.sample
  end
  interest = inter.uniq.join(',')
  language = langu.uniq.join(',')

  User.create(:uid => "-1", :provider => "facebook", :name => name, :email => "try@try.com", :place => cities.sample, :picture => avatars.sample, :interests => interest, :languages => language, :active_local => true, :day0 => day, :day1 => day, :day2 => day, :day3 => day, :day4 => day, :day5 => day, :day6 => day, :link => "https://www.facebook.com/app_scoped_user_id/76386629034978/")
end
