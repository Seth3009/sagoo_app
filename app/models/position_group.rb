class PositionGroup < ActiveRecord::Base
  belongs_to :employee_group
  belongs_to :employee
  has_many :restos
end
