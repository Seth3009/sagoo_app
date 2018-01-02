class Employee < ActiveRecord::Base
    has_many :restos
    has_many :position_groups, through: :restos
end
