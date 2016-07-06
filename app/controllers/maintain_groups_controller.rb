class MaintainGroupsController < ApplicationController
  before_action :set_maintain_group, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @maintain_groups = MaintainGroup.all
    respond_with(@maintain_groups)
  end

  def show
    respond_with(@maintain_group)
  end

  def new
    @maintain_group = MaintainGroup.new
    respond_with(@maintain_group)
  end

  def edit
  end

  def create
    @maintain_group = MaintainGroup.new(maintain_group_params)
    @maintain_group.save
    redirect_to :action => 'index'
  end

  def update
    @maintain_group.update(maintain_group_params)
    respond_with(@maintain_group)
  end

  def destroy
    @maintain_group.destroy
    respond_with(@maintain_group)
  end

  private
    def set_maintain_group
      @maintain_group = MaintainGroup.find(params[:group])
    end

    def maintain_group_params
      params.require(:maintain_group).permit(:group, :user_id)
    end
end
