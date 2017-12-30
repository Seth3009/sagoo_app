class GroupRostersController < ApplicationController
  before_action :set_group_roster, only: [:show, :edit, :update, :destroy]

  # GET /group_rosters
  # GET /group_rosters.json
  def index
    @group_rosters = GroupRoster.all
  end

  # GET /group_rosters/1
  # GET /group_rosters/1.json
  def show
  end

  # GET /group_rosters/new
  def new
    @group_roster = GroupRoster.new
  end

  # GET /group_rosters/1/edit
  def edit
  end

  # POST /group_rosters
  # POST /group_rosters.json
  def create
    @group_roster = GroupRoster.new(group_roster_params)

    respond_to do |format|
      if @group_roster.save
        format.html { redirect_to @group_roster, notice: 'Group roster was successfully created.' }
        format.json { render :show, status: :created, location: @group_roster }
      else
        format.html { render :new }
        format.json { render json: @group_roster.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_rosters/1
  # PATCH/PUT /group_rosters/1.json
  def update
    respond_to do |format|
      if @group_roster.update(group_roster_params)
        format.html { redirect_to @group_roster, notice: 'Group roster was successfully updated.' }
        format.json { render :show, status: :ok, location: @group_roster }
      else
        format.html { render :edit }
        format.json { render json: @group_roster.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_rosters/1
  # DELETE /group_rosters/1.json
  def destroy
    @group_roster.destroy
    respond_to do |format|
      format.html { redirect_to group_rosters_url, notice: 'Group roster was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_roster
      @group_roster = GroupRoster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_roster_params
      params.require(:group_roster).permit(:employee_group_id, :roster_id, :amount)
    end
end
