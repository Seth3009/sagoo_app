class PotonganEmployeesController < ApplicationController
  before_action :set_potongan_employee, only: [:show, :edit, :update, :destroy]

  # GET /potongan_employees
  # GET /potongan_employees.json
  def index
    @potongan_employees = PotonganEmployee.all
  end

  # GET /potongan_employees/1
  # GET /potongan_employees/1.json
  def show
  end

  # GET /potongan_employees/new
  def new
    @potongan_employee = PotonganEmployee.new
  end

  # GET /potongan_employees/1/edit
  def edit
  end

  # POST /potongan_employees
  # POST /potongan_employees.json
  def create
    @potongan_employee = PotonganEmployee.new(potongan_employee_params)

    respond_to do |format|
      if @potongan_employee.save
        format.html { redirect_to @potongan_employee, notice: 'Potongan employee was successfully created.' }
        format.json { render :show, status: :created, location: @potongan_employee }
      else
        format.html { render :new }
        format.json { render json: @potongan_employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /potongan_employees/1
  # PATCH/PUT /potongan_employees/1.json
  def update
    respond_to do |format|
      if @potongan_employee.update(potongan_employee_params)
        format.html { redirect_to :back, notice: 'Potongan employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @potongan_employee }
      else
        format.html { render :edit }
        format.json { render json: @potongan_employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /potongan_employees/1
  # DELETE /potongan_employees/1.json
  def destroy
    @potongan_employee.destroy
    respond_to do |format|
      format.html { redirect_to potongan_employees_url, notice: 'Potongan employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_potongan_employee
      @potongan_employee = PotonganEmployee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def potongan_employee_params
      params.require(:potongan_employee).permit(:pot_month, :employee_id, :nama_potongan, :kasbon_id, :amount)
    end
end
