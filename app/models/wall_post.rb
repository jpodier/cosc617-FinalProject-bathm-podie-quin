class WallPost < ActiveRecord::Base
  belongs_to :person
  belongs_to :author, :class_name => "Person", :foreign_key => "author_id"
end
