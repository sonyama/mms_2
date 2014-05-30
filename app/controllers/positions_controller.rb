class PositionsController < ApplicationController
  
  after_action :log_update, only: [:create, :update, :destroy]
  def index
    @positions = Position.paginate page: params[:page]
  end
  
  def show
    @position = Position.find params[:id]
    @users = @position.users.paginate page: params[:page]
  end
end
