class RenameColumnGroupIdToEmployeeGroupId < ActiveRecord::Migration
  def change
    rename_column :group_rosters, :group_id, :employee_group_id
  end
end
