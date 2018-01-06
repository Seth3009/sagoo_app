class PotonganEmployee < ActiveRecord::Base
  belongs_to :employee
  belongs_to :potongan
  belongs_to :kasbon
  
  def self.add_row_potong(emp,bulan,tahun)
      self.create(:employee_id => emp, :pot_month => Date.parse(tahun.to_s+ "-" + bulan.to_s + "-1"),:nama_potongan => "isi keterangan potongan", :amount => 0)
  end
end
