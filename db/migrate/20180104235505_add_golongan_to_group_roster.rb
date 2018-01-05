class AddGolonganToGroupRoster < ActiveRecord::Migration
  def change
    add_reference :group_rosters, :golongan, index: true, foreign_key: true
  end
end
