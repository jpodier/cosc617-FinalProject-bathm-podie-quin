class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :interests
      t.string :hobbies
      t.string :relationship

      t.timestamps null: false
    end
  end
end
