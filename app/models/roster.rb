class Roster < ActiveRecord::Base
    has_many :group_rosters
    has_many :group, through: :group_rosters
    
    
  def formatted_name
    "#{hari}  #{detail}"
  end
  
  def self.all_except(id)
    where.not(id: id)
  end
end
