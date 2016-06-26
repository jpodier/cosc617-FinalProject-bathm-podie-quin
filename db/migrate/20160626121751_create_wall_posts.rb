class CreateWallPosts < ActiveRecord::Migration
  def change
    create_table :wall_posts do |t|
      t.string :text
      t.string :date

      t.timestamps null: false
    end
  end
end
