class AddColumnToKasbon < ActiveRecord::Migration
  def change
    add_reference :kasbons, :employee, index: true, foreign_key: true
  end
end
