class SetDefaultValueToPotonganEmployee < ActiveRecord::Migration
  def change
    change_column_default(:potongan_employees, :amount, 0)
  end
end
