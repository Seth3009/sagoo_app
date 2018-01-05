class PositionGroup < ActiveRecord::Base
  belongs_to :golongan
  belongs_to :employee
  has_many :restos
end
