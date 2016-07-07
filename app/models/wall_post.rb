class WallPost < ActiveRecord::Base
  belongs_to :person
  validates_presence_of :person
  validates_presence_of :text
  has_many :wall_posts
attr_accessible :text, :date
end
