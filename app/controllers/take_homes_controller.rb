class TakeHomesController < ApplicationController
  before_action :set_take_home, only: [:show, :edit, :update, :destroy]

  # GET /take_homes
  # GET /take_homes.json
  def index
    @take_homes = TakeHome.all
   
  end

  # GET /take_homes/1
  # GET /take_homes/1.json
  def show
  end

  # GET /take_homes/new
  def new
    @take_home = TakeHome.new
  end

  # GET /take_homes/1/edit
  def edit
  end

  # POST /take_homes
  # POST /take_homes.json
  def create
    @take_home = TakeHome.new(take_home_params)

    respond_to do |format|
      if @take_home.save
        format.html { redirect_to @take_home, notice: 'Take home was successfully created.' }
        format.json { render :show, status: :created, location: @take_home }
      else
        format.html { render :new }
        format.json { render json: @take_home.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /take_homes/1
  # PATCH/PUT /take_homes/1.json
  def update
    respond_to do |format|
      if @take_home.update(take_home_params)
        format.html { redirect_to @take_home, notice: 'Take home was successfully updated.' }
        format.json { render :show, status: :ok, location: @take_home }
      else
        format.html { render :edit }
        format.json { render json: @take_home.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /take_homes/1
  # DELETE /take_homes/1.json
  def destroy
    @take_home.destroy
    respond_to do |format|
      format.html { redirect_to take_homes_url, notice: 'Take home was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_take_home
      @take_home = TakeHome.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def take_home_params
      params.require(:take_home).permit(:employee_id, :pay_month, :salary, :add_income, :sal_cut)
    end
end
