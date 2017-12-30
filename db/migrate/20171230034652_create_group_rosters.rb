class CreateGroupRosters < ActiveRecord::Migration
  def change
    create_table :group_rosters do |t|
      t.references :group, index: true, foreign_key: true
      t.references :roster, index: true, foreign_key: true
      t.decimal :amount

      t.timestamps null: false
    end
  end
end
