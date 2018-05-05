class AddGpIntoEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :gp, :string
  end
end
