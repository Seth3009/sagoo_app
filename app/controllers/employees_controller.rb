class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy, :salary_detail, :tambah_income, :add_potong, :kasbon]

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
  
   Attendance.generate_attendance_form(Date.parse(params[:year]+ "-" + params[:month] + "-1"))
   Attendance.calculate_take_home(Date.parse(params[:year]+ "-" + params[:month] + "-1"))
   @attendances = Employee.joins('left join restos on restos.employee_id = employees.id')
   .joins('left join position_groups on position_groups.id = restos.position_group_id')
   .joins('left join golongans on golongans.id = position_groups.golongan_id')
   .joins('left join take_homes on take_homes.employee_id = employees.id')
   .joins('left join locations on locations.id = restos.location_id')
   .select('golongans.*','employees.*','locations.name as location', 'take_homes.salary','take_homes.add_income','take_homes.sal_cut')
   .where('take_homes.pay_month = ?', Date.parse(params[:year]+"-"+params[:month]+"-1"))

  end  
  
  def salary_detail
    #@pots = PotonganEmployee.where('employee_id = ?', @employee)
    @atts = Attendance.where('attendances.employee_id = ? AND attendances.att_month = ?', @employee, Date.parse(params[:year]+ "-" + params[:month] + "-1"))
            .joins('left join group_rosters on group_rosters.id = attendances.group_roster_id')
            .joins('left join rosters on rosters.id = group_rosters.roster_id').all
    @total_hadir = 0      
    @atts.each do |att|
      if att.group_roster.roster.tipe == "Minus"
        @total_hadir = @total_hadir - (att.group_roster.amount * att.day_count) 
      else
        @total_hadir = @total_hadir + (att.group_roster.amount * att.day_count)
      end
    end
    @additions = AdditionalIncome.where('employee_id=? and add_month = ?', @employee, Date.parse(params[:year]+ "-" + params[:month] + "-1"))        
    @total_add = 0
    @additions.each do |add|
      @total_add = @total_add + add.amount
    end
    
    @pots = PotonganEmployee.where('potongan_employees.employee_id=? and pot_month = ?', @employee, Date.parse(params[:year]+ "-" + params[:month] + "-1"))        
            .joins('left outer join kasbons on kasbons.id = potongan_employees.kasbon_id')
    @total_pot = 0
    @pots.each do |pot|
      @total_pot = @total_pot + pot.amount
    end
    
    @total = @total_hadir + @total_add - @total_pot
    
  end
  
  def tambah_income
    @additional_income = AdditionalIncome.new
  end
  def add_row
    AdditionalIncome.add_row_income(params[:id],params[:month],params[:year])
    redirect_to :back
  end
  def add_potong
    PotonganEmployee.add_row_potong(params[:id],params[:month],params[:year])
    redirect_to :back
  end
  
  def kasbon
    @kasbons = Kasbon.where('employee_id = ?', @employee)
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
