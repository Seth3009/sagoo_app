class CreateAdditionalIncomes < ActiveRecord::Migration
  def change
    create_table :additional_incomes do |t|
      t.date :add_month
      t.string :name
      t.decimal :amount
      t.references :employee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
