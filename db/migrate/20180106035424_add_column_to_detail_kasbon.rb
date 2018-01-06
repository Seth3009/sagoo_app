class AddColumnToDetailKasbon < ActiveRecord::Migration
  def change
    add_reference :detail_kasbons, :kasbon, index: true, foreign_key: true
  end
end
