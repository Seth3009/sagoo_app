class Attendance < ActiveRecord::Base
  belongs_to :group_roster
  belongs_to :employee
  has_many :salaries
end
