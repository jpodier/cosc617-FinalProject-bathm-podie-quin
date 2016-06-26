class Friendship < ActiveRecord::Base
  belongs_to :person, :foreign_key => "requester_id"
  belongs_to :friend, :class_name => "Person", :foreign_key => "granter_id"
end
