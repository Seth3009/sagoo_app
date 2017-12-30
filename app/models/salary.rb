class Salary < ActiveRecord::Base
  belongs_to :employee
  has_many :attendances
end
