class PositionGroupsController < ApplicationController
  before_action :set_position_group, only: [:show, :edit, :update, :destroy]

  # GET /position_groups
  # GET /position_groups.json
  def index
    @position_groups = PositionGroup.all
  end

  # GET /position_groups/1
  # GET /position_groups/1.json
  def show
  end

  # GET /position_groups/new
  def new
    @position_group = PositionGroup.new
  end

  # GET /position_groups/1/edit
  def edit
  end

  # POST /position_groups
  # POST /position_groups.json
  def create
    @position_group = PositionGroup.new(position_group_params)

    respond_to do |format|
      if @position_group.save
        format.html { redirect_to @position_group, notice: 'Position group was successfully created.' }
        format.json { render :show, status: :created, location: @position_group }
      else
        format.html { render :new }
        format.json { render json: @position_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /position_groups/1
  # PATCH/PUT /position_groups/1.json
  def update
    respond_to do |format|
      if @position_group.update(position_group_params)
        format.html { redirect_to @position_group, notice: 'Position group was successfully updated.' }
        format.json { render :show, status: :ok, location: @position_group }
      else
        format.html { render :edit }
        format.json { render json: @position_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /position_groups/1
  # DELETE /position_groups/1.json
  def destroy
    @position_group.destroy
    respond_to do |format|
      format.html { redirect_to position_groups_url, notice: 'Position group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_position_group
      @position_group = PositionGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def position_group_params
      params.require(:position_group).permit(:name, :note, :employee_group_id)
    end
end
