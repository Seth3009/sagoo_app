class Roster < ActiveRecord::Base
    has_many :group_rosters
    has_many :group, through: :group_rosters
end
