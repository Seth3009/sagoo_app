class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :acc_no
      t.string :pob
      t.date :dob
      t.date :work_started
      t.date :work_end

      t.timestamps null: false
    end
  end
end
