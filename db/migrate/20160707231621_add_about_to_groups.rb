class AddAboutToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :about, :string
  end
end
