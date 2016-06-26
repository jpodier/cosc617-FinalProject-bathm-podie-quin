class Person < ActiveRecord::Base
  has_many :friendships, :foreign_key => "requester_id"
  has_many :friends, :through => :friendships
  has_many :wall_posts
  has_and_belongs_to_many :groups
end