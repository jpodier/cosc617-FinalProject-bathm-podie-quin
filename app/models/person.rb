class Person < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :friendships, :foreign_key => "requester_id"
  has_many :friends, :through => :friendships
  has_many :wall_posts
  has_and_belongs_to_many :groups
end
