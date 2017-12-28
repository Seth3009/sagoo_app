class CreateRestos < ActiveRecord::Migration
  def change
    create_table :restos do |t|
      t.date :started
      t.date :ended
      t.references :employee, index: true, foreign_key: true
      t.references :position_group, index: true, foreign_key: true
      t.references :location, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
