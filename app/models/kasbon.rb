class Kasbon < ActiveRecord::Base
    has_many :potongan_employees
    has_many :detail_kasbons
    
    def self.sum_sisa
        @kasbons = self.all
        @kasbons.each do |kasbon|
           if kasbon.nil? == false    
                Kasbon.update(kasbon.id, :sisa => kasbon.jumlah_bayar.nil? ? kasbon.jumlah_pinjam : (kasbon.jumlah_pinjam - kasbon.jumlah_bayar)) 
           end
        end
    end
end
