class RemoveEmployeeGroupFromGroupRoster < ActiveRecord::Migration
  def change
    remove_column :group_rosters, :employee_group_id
  end
end
