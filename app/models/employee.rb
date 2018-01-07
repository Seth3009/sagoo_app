class Employee < ActiveRecord::Base
    has_many :restos
    has_many :position_groups, through: :restos
    has_many :additional_incomes
    has_many :potongan_employees
    has_many :kasbons
    has_many :detail_kasbons, through: :kasbons
end
