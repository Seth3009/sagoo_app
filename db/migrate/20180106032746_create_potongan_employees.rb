class CreatePotonganEmployees < ActiveRecord::Migration
  def change
    create_table :potongan_employees do |t|
      t.date :pot_month
      t.references :employee, index: true, foreign_key: true
      t.references :potongan, index: true, foreign_key: true
      t.references :kasbon, index: true, foreign_key: true
      t.decimal :amount

      t.timestamps null: false
    end
  end
end
