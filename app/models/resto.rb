class Resto < ActiveRecord::Base
  belongs_to :employee
  belongs_to :position_group
  belongs_to :location
end
