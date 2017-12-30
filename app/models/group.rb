class Group < ActiveRecord::Base
    has_many :position_groups
    has_many :group_rosters
    has_many :rosters, through: :group_rosters
end
