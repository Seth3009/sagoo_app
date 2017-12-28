class PositionGroup < ActiveRecord::Base
  belongs_to :group
  has_many :restos
end
