class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.decimal :salary
      t.text :note

      t.timestamps null: false
    end
  end
end
