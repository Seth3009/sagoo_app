class CreateEmployeeGroups < ActiveRecord::Migration
  def change
    create_table :employee_groups do |t|
      t.string :name
      t.decimal :salary
      t.text :note

      t.timestamps null: false
    end
  end
end
