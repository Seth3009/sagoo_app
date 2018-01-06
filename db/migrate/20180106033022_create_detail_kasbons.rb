class CreateDetailKasbons < ActiveRecord::Migration
  def change
    create_table :detail_kasbons do |t|
      t.date :tanggal_bayar
      t.decimal :jumlah_bayar
      t.decimal :sisa

      t.timestamps null: false
    end
  end
end
