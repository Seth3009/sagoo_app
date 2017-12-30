class RenameColumnGroupIdToEmployeeGroupIdOnPositionGroup < ActiveRecord::Migration
  def change
    rename_column :position_groups, :group_id, :employee_group_id
  end
end
