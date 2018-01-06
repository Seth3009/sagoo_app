class PotonganEmployee < ActiveRecord::Base
  belongs_to :employee
  belongs_to :potongan
  belongs_to :kasbon
  
  def self.add_row_potong(emp,bulan,tahun)
      self.create(:employee_id => emp, :pot_month => Date.parse(tahun.to_s+ "-" + bulan.to_s + "-1"),:nama_potongan => "isi keterangan potongan", :amount => 0)
  end
  
  def self.update_amount_kasbon(emp,bulan,tahun)
    @ks = Kasbon.joins('left join detail_kasbons on detail_kasbons.kasbon_id = kasbons.id').where('kasbons.employee_id = ? and detail_kasbons.tanggal_bayar = ?', emp, Date.parse(tahun.to_s+ "-" + bulan.to_s + "-1")).select('kasbons.id','detail_kasbons.jumlah_bayar as bayar').first
    @pot = PotonganEmployee.where('employee_id = ? and potongan_employees.kasbon_id =?',emp, @ks.id)
    @pot.each do |pot|
      PotonganEmployee.update(pot.id, amount: @ks.bayar)
    end
  end
end
