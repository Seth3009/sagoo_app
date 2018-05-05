class CreatePositionGroups < ActiveRecord::Migration
  def change
    create_table :position_groups do |t|
      t.string :name
      t.text :note
      

      t.timestamps null: false
    end
  end
end
