class MaintainStatesController < ApplicationController
  before_action :set_maintain_state, only: [:show, :edit, :update, :destroy]

  # GET /maintain_states
  # GET /maintain_states.json
  def index
    @maintain_states = MaintainState.all
  end

  # GET /maintain_states/1
  # GET /maintain_states/1.json
  def show
  end

  # GET /maintain_states/new
  def new
    @maintain_state = MaintainState.new
  end

  # GET /maintain_states/1/edit
  def edit
  end

  # POST /maintain_states
  # POST /maintain_states.json
  def create
    @maintain_state = MaintainState.new(maintain_state_params)

    respond_to do |format|
      if @maintain_state.save
        format.html { redirect_to @maintain_state, notice: 'Maintain state was successfully created.' }
        format.json { render :show, status: :created, location: @maintain_state }
      else
        format.html { render :new }
        format.json { render json: @maintain_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maintain_states/1
  # PATCH/PUT /maintain_states/1.json
  def update
    respond_to do |format|
      if @maintain_state.update(maintain_state_params)
        format.html { redirect_to @maintain_state, notice: 'Maintain state was successfully updated.' }
        format.json { render :show, status: :ok, location: @maintain_state }
      else
        format.html { render :edit }
        format.json { render json: @maintain_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maintain_states/1
  # DELETE /maintain_states/1.json
  def destroy
    @maintain_state.destroy
    respond_to do |format|
      format.html { redirect_to maintain_states_url, notice: 'Maintain state was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maintain_state
      @maintain_state = MaintainState.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def maintain_state_params
      params.require(:maintain_state).permit(:state)
    end
end
