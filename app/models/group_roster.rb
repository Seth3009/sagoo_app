class GroupRoster < ActiveRecord::Base
  belongs_to :golongan
  belongs_to :roster
end
