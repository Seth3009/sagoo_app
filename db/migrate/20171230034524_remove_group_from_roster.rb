class RemoveGroupFromRoster < ActiveRecord::Migration
  def change
    remove_column :rosters, :group_id, :integer
  end
end
