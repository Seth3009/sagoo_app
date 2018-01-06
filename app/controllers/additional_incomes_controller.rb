class AdditionalIncomesController < ApplicationController
  before_action :set_additional_income, only: [:show, :edit, :update, :destroy]

  # GET /additional_incomes
  # GET /additional_incomes.json
  def index
    @additional_incomes = AdditionalIncome.all
  end

  # GET /additional_incomes/1
  # GET /additional_incomes/1.json
  def show
  end

  # GET /additional_incomes/new
  def new
    @additional_income = AdditionalIncome.new
  end

  # GET /additional_incomes/1/edit
  def edit
  end

  # POST /additional_incomes
  # POST /additional_incomes.json
  def create
    @additional_income = AdditionalIncome.new(additional_income_params)

    respond_to do |format|
      if @additional_income.save
        format.html { redirect_to @additional_income, notice: 'Additional income was successfully created.' }
        format.json { render :show, status: :created, location: @additional_income }
      else
        format.html { render :new }
        format.json { render json: @additional_income.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /additional_incomes/1
  # PATCH/PUT /additional_incomes/1.json
  def update
    respond_to do |format|
      if @additional_income.update(additional_income_params)
        format.html { redirect_to :back, notice: 'Additional income was successfully updated.' }
        format.json { render :show, status: :ok, location: @additional_income }
      else
        format.html { render :edit }
        format.json { render json: @additional_income.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /additional_incomes/1
  # DELETE /additional_incomes/1.json
  def destroy
    @additional_income.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Additional income was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_additional_income
      @additional_income = AdditionalIncome.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def additional_income_params
      params.require(:additional_income).permit(:add_month, :name, :amount, :employee_id)
    end
end
