class Resto < ActiveRecord::Base
  validates :employee_id, uniqueness: true
  belongs_to :employee
  belongs_to :position_group
  belongs_to :location
end
