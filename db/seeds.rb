# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Person.delete_all
Group.delete_all
WallPost.delete_all
Friendship.delete_all

robert = Person.create(:name => "Robert", :email => "rbathm1@students.towson.edu",
                       :password => "password", :password_confirmation => "password")
jose = Person.create(:name => "Jose", :email => "jquinc1@students.towson.edu",
                     :password => "password", :password_confirmation => "password")
pandora = Person.create(:name => "Pandora", :email => "jpodie1@students.towson.edu",
                        :password => "password", :password_confirmation => "password")

robert.friends << jose
robert.friends << pandora

wallPost1 = WallPost.create(:text => "Happy Birthday!")
robert.wall_posts << wallPost1

cosc617Group = Group.create(:name => "COSC 617")
cosc617Group.people << robert
cosc617Group.people << pandora


