class CreateSalaries < ActiveRecord::Migration
  def change
    create_table :salaries do |t|
      t.date :salary_period
      t.references :employee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
