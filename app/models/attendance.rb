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
          @grouprosters = GroupRoster.where('group_rosters.golongan_id = ?', position.golongan_id)
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
  
  def self.calculate_take_home(bulan)
    @employees = Employee.all
    @employees.each do |employee|
        @att = Attendance.where('employee_id = ? and att_month = ?', employee.id,bulan)
        @addt = AdditionalIncome.where('employee_id = ? and add_month = ?', employee.id,bulan)
        @totalsal = 0
        @addincome = 0
        @att.each do |att|
           @totalsal = @totalsal + (att.day_count * att.group_roster.amount)
        end
        @addt.each do |addt|
            @addincome = @addincome + addt.amount
        end
        @ths = TakeHome.where('take_homes.employee_id = ? and pay_month = ?', employee.id,bulan)
        if @ths.empty? then
             @takehome = TakeHome.create(employee_id: employee.id, pay_month: bulan, salary: @totalsal, add_income:@addincome, sal_cut: 0)
        else
            @ths.each do |th|
                @takehome = TakeHome.update(th.id, :salary=> @totalsal, :add_income => @addincome, :sal_cut => 0)
            end
        end
    end
 end
end
