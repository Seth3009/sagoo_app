class GolongansController < ApplicationController
  before_action :set_golongan, only: [:show, :edit, :update, :destroy]

  # GET /golongans
  # GET /golongans.json
  def index
    @golongans = Golongan.all
  end

  # GET /golongans/1
  # GET /golongans/1.json
  def show
  end

  # GET /golongans/new
  def new
    @golongan = Golongan.new
  end

  # GET /golongans/1/edit
  def edit
  end

  # POST /golongans
  # POST /golongans.json
  def create
    @golongan = Golongan.new(golongan_params)

    respond_to do |format|
      if @golongan.save
        format.html { redirect_to @golongan, notice: 'Golongan was successfully created.' }
        format.json { render :show, status: :created, location: @golongan }
      else
        format.html { render :new }
        format.json { render json: @golongan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /golongans/1
  # PATCH/PUT /golongans/1.json
  def update
    respond_to do |format|
      if @golongan.update(golongan_params)
        format.html { redirect_to @golongan, notice: 'Golongan was successfully updated.' }
        format.json { render :show, status: :ok, location: @golongan }
      else
        format.html { render :edit }
        format.json { render json: @golongan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /golongans/1
  # DELETE /golongans/1.json
  def destroy
    @golongan.destroy
    respond_to do |format|
      format.html { redirect_to golongans_url, notice: 'Golongan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def roster_group
   @rosters = GroupRoster.where('golongan_id = ?', params[:id])
   @golongan = Golongan.find(params[:id])
   @group_roster = GroupRoster.new
 end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_golongan
      @golongan = Golongan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def golongan_params
      params.require(:golongan).permit(:nama, :gaji, :note)
    end
end
