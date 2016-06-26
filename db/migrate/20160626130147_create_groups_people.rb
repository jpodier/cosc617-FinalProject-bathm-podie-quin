class CreateGroupsPeople < ActiveRecord::Migration
  def change
    create_table :groups_people, id:false do |t|
      t.belongs_to :person
      t.belongs_to :group
    end
  end
end
