class PotongansController < ApplicationController
  before_action :set_potongan, only: [:show, :edit, :update, :destroy]

  # GET /potongans
  # GET /potongans.json
  def index
    @potongans = Potongan.all
  end

  # GET /potongans/1
  # GET /potongans/1.json
  def show
  end

  # GET /potongans/new
  def new
    @potongan = Potongan.new
  end

  # GET /potongans/1/edit
  def edit
  end

  # POST /potongans
  # POST /potongans.json
  def create
    @potongan = Potongan.new(potongan_params)

    respond_to do |format|
      if @potongan.save
        format.html { redirect_to @potongan, notice: 'Potongan was successfully created.' }
        format.json { render :show, status: :created, location: @potongan }
      else
        format.html { render :new }
        format.json { render json: @potongan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /potongans/1
  # PATCH/PUT /potongans/1.json
  def update
    respond_to do |format|
      if @potongan.update(potongan_params)
        format.html { redirect_to @potongan, notice: 'Potongan was successfully updated.' }
        format.json { render :show, status: :ok, location: @potongan }
      else
        format.html { render :edit }
        format.json { render json: @potongan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /potongans/1
  # DELETE /potongans/1.json
  def destroy
    @potongan.destroy
    respond_to do |format|
      format.html { redirect_to potongans_url, notice: 'Potongan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_potongan
      @potongan = Potongan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def potongan_params
      params.require(:potongan).permit(:nama)
    end
end
