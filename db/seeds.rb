# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

s = User.create(name: 'Spencer Spezzano', email: 'smspezzano@gmail.com', password: 'foobar', password_confirmation: 'foobar')
r = User.create(:name => 'Raphael', :email => "rafi.sofaer@generalassemb.ly", :password => "asdasd", :password_confirmation => "asdasd")

r1 = Route.create(startLocation: '22 Terra Vista Ave, San Francisco, CA', endLocation: '414 Brannan St, San Francisco, CA', roadGradeStrategy: 'AVOID_ALL_HILLS', user_id: '1')

