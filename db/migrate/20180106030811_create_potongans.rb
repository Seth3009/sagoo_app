class CreatePotongans < ActiveRecord::Migration
  def change
    create_table :potongans do |t|
      t.string :nama

      t.timestamps null: false
    end
  end
end
