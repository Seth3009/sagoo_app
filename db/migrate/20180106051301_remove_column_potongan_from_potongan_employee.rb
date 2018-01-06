class RemoveColumnPotonganFromPotonganEmployee < ActiveRecord::Migration
  def change
    remove_column :potongan_employees, :potongan_id
    add_column :potongan_employees, :nama_potongan, :string
  end
end
