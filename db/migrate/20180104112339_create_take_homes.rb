class CreateTakeHomes < ActiveRecord::Migration
  def change
    create_table :take_homes do |t|
      t.references :employee, index: true, foreign_key: true
      t.date :pay_month
      t.decimal :salary
      t.decimal :add_income
      t.decimal :sal_cut

      t.timestamps null: false
    end
  end
end
