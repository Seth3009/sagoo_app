class CreateGolongans < ActiveRecord::Migration
  def change
    create_table :golongans do |t|
      t.string :nama
      t.decimal :gaji
      t.text :note

      t.timestamps null: false
    end
  end
end
