class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.string :requester_id
      t.string :granter_id
      t.boolean :accepted

      t.timestamps null: false
    end
  end
end
