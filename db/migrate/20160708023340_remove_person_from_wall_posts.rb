class RemovePersonFromWallPosts < ActiveRecord::Migration
  def change
    remove_column :wall_posts, :person
  end
end
