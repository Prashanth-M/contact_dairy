# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if AdminUser.count == 0
	AdminUser.create!(:email => "prashanth.m@pacewisdom.com", :password => "password")
	AdminUser.create!(:email => "rajathsajnani@gmail.com", :password => "sajnani@234")
end