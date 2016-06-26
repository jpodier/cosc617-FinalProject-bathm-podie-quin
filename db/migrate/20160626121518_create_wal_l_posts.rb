class CreateWalLPosts < ActiveRecord::Migration
  def change
    create_table :wal_l_posts do |t|
      t.string :text
      t.string :date

      t.timestamps null: false
    end
  end
end
