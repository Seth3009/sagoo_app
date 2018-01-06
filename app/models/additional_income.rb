class AdditionalIncome < ActiveRecord::Base
  belongs_to :employee
  
  def self.add_row_income(emp,bulan,tahun)
      self.create(:employee_id => emp, :add_month => Date.parse(tahun.to_s+ "-" + bulan.to_s + "-1"),:name => "isi keterangan income", :amount => 0)
  end
  
end
