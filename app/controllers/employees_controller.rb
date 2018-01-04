class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy, :salary_detail]

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

 
  def salary_recap
   # @attendances = Employee
   # .joins('left join restos on restos.employee_id = employees.id')
   # .joins('left join locations on locations.id = restos.location_id')
   # .joins('left join position_groups on position_groups.id = restos.position_group_id')
   # .joins('left join employee_groups on employee_groups.id = position_groups.employee_group_id')
   # .joins('left join attendances on attendances.employee_id = employees.id')
   # .joins('left join group_rosters on group_rosters.id = attendances.group_roster_id')
   # .select('attendances.att_month', 'employees.name','employees.work_started','employees.acc_no','employee_groups.name as gol', 'employee_groups.salary','locations.name as location')
   # .group('employees.id').select('sum (group_rosters.amount * attendances.day_count) as total')
   # .where('attendances.att_month = ?', Date.parse("2017-"+params[:month]+"-30"))
   #if params[:month].to_i > 12 || params[:month].to_i < 1
          #params[:month] = Date.today.month.to_s
          #redirect_to salary_recap_path(params[:month],params[:year])
   #end
    
   Attendance.generate_attendance_form(Date.parse(params[:year]+ "-" + params[:month] + "-1"))
   Attendance.calculate_take_home(Date.parse(params[:year]+ "-" + params[:month] + "-1"))
   @attendances = Employee.joins('left join restos on restos.employee_id = employees.id')
   .joins('left join position_groups on position_groups.id = restos.position_group_id')
   .joins('left join employee_groups on employee_groups.id = position_groups.employee_group_id')
   .joins('left join take_homes on take_homes.employee_id = employees.id')
   .joins('left join locations on locations.id = restos.location_id')
   .group('employees.id')
   .select('employees.id','employees.name','employees.work_started','employees.acc_no','employee_groups.name as golongan','employee_groups.salary','locations.name as location','take_homes.salary as gaji','take_homes.add_income')
   
                        
    @attendances = @attendances.where('take_homes.pay_month = ?', Date.parse(params[:year]+"-"+params[:month]+"-1"))
                   
                 
                  
  end  
  
  def salary_detail
    @atts = Attendance.where('attendances.employee_id = ? AND attendances.att_month = ?', @employee, Date.parse(params[:year]+ "-" + params[:month] + "-1"))
            .joins('left join group_rosters on group_rosters.id = attendances.group_roster_id').all
    @additions = AdditionalIncome.where('employee_id=? and add_month = ?', @employee, Date.parse(params[:year]+ "-" + params[:month] + "-1"))        
    @total_hadir = @atts.group('attendances.att_month').select('sum (group_rosters.amount * attendances.day_count) as total','attendances.att_month').first
    @total_add = @additions.group('additional_incomes.add_month').select('sum(additional_incomes.amount) as tot_add').first
    @total =(@total_hadir.nil? ? 0 : @total_hadir.total) + (@total_add.nil? ? 0 :@total_add.tot_add)
    
  end
  
  def tambah_income
    @additional_income = AdditionalIncome.new
  end
  
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:name, :phone, :email, :acc_no, :pob, :dob, :work_started, :work_end)
    end
end
