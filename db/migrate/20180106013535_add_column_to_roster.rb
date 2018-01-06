class AddColumnToRoster < ActiveRecord::Migration
  def change
    add_column :rosters, :tipe, :string
  end
end
