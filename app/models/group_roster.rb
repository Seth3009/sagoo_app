class GroupRoster < ActiveRecord::Base
  belongs_to :employee_group
  belongs_to :roster
end
