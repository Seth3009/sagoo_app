class AddGolonganToPositionGroup < ActiveRecord::Migration
  def change
    add_reference :position_groups, :golongan, index: true, foreign_key: true
  end
end
