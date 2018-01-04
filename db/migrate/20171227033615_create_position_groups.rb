class CreatePositionGroups < ActiveRecord::Migration
  def change
    create_table :position_groups do |t|
      t.string :name
      t.text :note
      t.references :employee_group, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
