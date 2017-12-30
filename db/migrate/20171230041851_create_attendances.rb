class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.date :att_month
      t.integer :day_count
      t.references :group_roster, index: true, foreign_key: true
      t.references :employee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
