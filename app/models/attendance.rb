class Attendance < ActiveRecord::Base
  belongs_to :group_roster
  belongs_to :employee
  has_many :salaries
  
  def self.generate_attendance_form(bulan)
   @employees = Employee.all
    @employees.each do |employee|
      @restos = Resto.where('restos.employee_id = ?', employee.id)
      @restos.each do |resto|
         @positions = PositionGroup.where('position_groups.id = ?', resto.position_group_id)
         @positions.each do |position|
          @grouprosters = GroupRoster.where('group_rosters.employee_group_id = ?', position.employee_group_id)
          @grouprosters.each do |gr|
            @att = self.where('att_month = ? AND group_roster_id = ? AND employee_id = ?',bulan,gr.id,employee.id).first
            if @att.blank? then
              @attendance = self.new(att_month: bulan, day_count: 0, group_roster_id: gr.id, employee_id: employee.id)
              @attendance.save
            end
          end
        end
      end
      
    end
  end
end
