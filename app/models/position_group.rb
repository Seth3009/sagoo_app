class PositionGroup < ActiveRecord::Base
  belongs_to :employee_group
  has_many :restos
end
