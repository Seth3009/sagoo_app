class CreateKasbons < ActiveRecord::Migration
  def change
    create_table :kasbons do |t|
      t.string :nama
      t.date :tanggal_pinjam
      t.decimal :jumlah_pinjam
      t.string :tanggal_bayar
      t.decimal :jumlah_bayar
      t.decimal :sisa

      t.timestamps null: false
    end
  end
end
