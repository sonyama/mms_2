class Admin::UsersController < ApplicationController
  def new
  end
  
  def create
    @user = User.new user_params
    if @user.save
      sign_in @user
      flash[:success] = "Add success!"
    else
      render 'new'
    end
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find params[:id] 
  end

  def index
    @users = User.paginate page: params[:page]
  end

  private

    def user_params
      params.require :user .permit :name, :dob, :email, :password,
                                   :password_confirmation
    end
    def admmin_user
      redirect_to(root_url) unless current_user.admin?
    end
end