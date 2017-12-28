class CreateRosters < ActiveRecord::Migration
  def change
    create_table :rosters do |t|
      t.string :hari
      t.string :detail
      t.text :note

      t.timestamps null: false
    end
  end
end
