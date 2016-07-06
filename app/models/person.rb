class Person < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :friendships, -> {where(accepted: true)}, :foreign_key => "requester_id"
  has_many :friends, :through => :friendships

  has_many :awaiting_friendships, -> {where(accepted: false)}, :foreign_key => "requester_id", :class_name => "Friendship"
  has_many :awaiting_friends, :through => :awaiting_friendships

  has_many :pending_friendships, -> {where(accepted: false)}, :foreign_key => "granter_id", :class_name => "Friendship"
  has_many :pending_friends, :through => :pending_friendships

  has_many :wall_posts
  has_and_belongs_to_many :groups

  mount_uploader :photo, PhotoUploader

  def self.search(name)
    if name
      where("name LIKE :name", {:name => "%#{name}%"})
    else
      find(:all)
    end
  end
end
