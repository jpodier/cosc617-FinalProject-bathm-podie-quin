class Friendship < ActiveRecord::Base

  belongs_to :person, :foreign_key => "requester_id"
  belongs_to :friend, :class_name => "Person", :foreign_key => "granter_id"
  belongs_to :pending_friend, :class_name => "Person", :foreign_key => "requester_id"
  belongs_to :awaiting_friend, :class_name => "Person", :foreign_key => "granter_id"
end
