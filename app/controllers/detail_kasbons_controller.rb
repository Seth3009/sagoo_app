class DetailKasbonsController < ApplicationController
  before_action :set_detail_kasbon, only: [:show, :edit, :update, :destroy]

  # GET /detail_kasbons
  # GET /detail_kasbons.json
  def index
    @detail_kasbons = DetailKasbon.all
  end

  # GET /detail_kasbons/1
  # GET /detail_kasbons/1.json
  def show
  end

  # GET /detail_kasbons/new
  def new
    @detail_kasbon = DetailKasbon.new
  end

  # GET /detail_kasbons/1/edit
  def edit
  end

  # POST /detail_kasbons
  # POST /detail_kasbons.json
  def create
    @detail_kasbon = DetailKasbon.new(detail_kasbon_params)

    respond_to do |format|
      if @detail_kasbon.save
        Kasbon.sum_sisa
        format.html { redirect_to :back, notice: 'Detail kasbon was successfully created.' }
        format.json { render :show, status: :created, location: @detail_kasbon }
      else
        format.html { render :new }
        format.json { render json: @detail_kasbon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /detail_kasbons/1
  # PATCH/PUT /detail_kasbons/1.json
  def update
    respond_to do |format|
      if @detail_kasbon.update(detail_kasbon_params)
        format.html { redirect_to @detail_kasbon, notice: 'Detail kasbon was successfully updated.' }
        format.json { render :show, status: :ok, location: @detail_kasbon }
      else
        format.html { render :edit }
        format.json { render json: @detail_kasbon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detail_kasbons/1
  # DELETE /detail_kasbons/1.json
  def destroy
    @detail_kasbon.destroy
    Kasbon.sum_sisa
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Detail kasbon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detail_kasbon
      @detail_kasbon = DetailKasbon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def detail_kasbon_params
      params.require(:detail_kasbon).permit(:kasbon_id, :tanggal_bayar, :jumlah_bayar, :sisa)
    end
end
