class KasbonsController < ApplicationController
  before_action :set_kasbon, only: [:show, :edit, :update, :destroy]

  # GET /kasbons
  # GET /kasbons.json
  def index
    @kasbons = Kasbon.all
    Kasbon.sum_sisa
  end

  # GET /kasbons/1
  # GET /kasbons/1.json
  def show
    @employee = Employee.find(@kasbon.employee_id)
    @details = DetailKasbon.where('kasbon_id = ?', @kasbon).order(:tanggal_bayar)
    @detail_kasbon = DetailKasbon.new
  end

  # GET /kasbons/new
  def new
    @kasbon = Kasbon.new
  end

  # GET /kasbons/1/edit
  def edit
  end

  # POST /kasbons
  # POST /kasbons.json
  def create
    @kasbon = Kasbon.new(kasbon_params)

    respond_to do |format|
      if @kasbon.save
        format.html { redirect_to @kasbon, notice: 'Kasbon was successfully created.' }
        format.json { render :show, status: :created, location: @kasbon }
      else
        format.html { render :new }
        format.json { render json: @kasbon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kasbons/1
  # PATCH/PUT /kasbons/1.json
  def update
    respond_to do |format|
      if @kasbon.update(kasbon_params)
        format.html { redirect_to @kasbon, notice: 'Kasbon was successfully updated.' }
        format.json { render :show, status: :ok, location: @kasbon }
      else
        format.html { render :edit }
        format.json { render json: @kasbon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kasbons/1
  # DELETE /kasbons/1.json
  def destroy
    @kasbon.destroy
    respond_to do |format|
      format.html { redirect_to kasbons_url, notice: 'Kasbon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kasbon
      @kasbon = Kasbon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kasbon_params
      params.require(:kasbon).permit(:employee_id, :nama, :tanggal_pinjam, :jumlah_pinjam, :tanggal_bayar, :jumlah_bayar, :sisa)
    end
end
