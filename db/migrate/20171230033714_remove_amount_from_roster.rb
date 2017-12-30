class RemoveAmountFromRoster < ActiveRecord::Migration
  def change
    remove_column :rosters, :amount, :decimal
  end
end
