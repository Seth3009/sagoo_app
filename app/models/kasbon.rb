class Kasbon < ActiveRecord::Base
    has_many :potongan_employees
    has_many :detail_kasbons
    
    def self.sum_sisa
        @kasbons = self.all
        @kasbons.each do |kasbon|
            if kasbon.nil? == false
               @tot_bayar = 0
               @dk = DetailKasbon.where('kasbon_id = ?',kasbon.id).order('tanggal_bayar')
               @tgl = @dk.last
               if @dk.nil? == false
                   @dk.each do |dk|
                        @tot_bayar = @tot_bayar + dk.jumlah_bayar
                        DetailKasbon.update(dk.id,:sisa => kasbon.jumlah_pinjam - @tot_bayar)
                   end   
                   Kasbon.update(kasbon.id, :sisa => (kasbon.jumlah_pinjam - @tot_bayar),:jumlah_bayar => @tot_bayar, :tanggal_bayar => (@tgl.nil? ? "" : @tgl.tanggal_bayar)) 
                   
               end
            end
        end
    end
    
    def self.kasbon_to_hash(emp)
        @emplos = self.where('employee_id = ?', emp).all
        
        @emplos.each_with_object({}) do |emplo,hash|
            hash[emplo.id] = emplo.nama + " [sisa: " + emplo.sisa.to_s + "]"
        end
    end
        
end
