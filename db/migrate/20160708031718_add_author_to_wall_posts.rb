class AddAuthorToWallPosts < ActiveRecord::Migration
  def change
    add_column :wall_posts, :author_id, :string
  end
end
