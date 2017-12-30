class AddAmountToRoster < ActiveRecord::Migration
  def change
    add_column :rosters, :amount, :decimal
  end
end
