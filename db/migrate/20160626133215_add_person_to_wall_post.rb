class AddPersonToWallPost < ActiveRecord::Migration
  def change
    add_column :wall_posts, :person_id, :string
  end
end
