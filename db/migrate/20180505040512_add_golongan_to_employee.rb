class AddGolonganToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :golongan, :string
  end
end
