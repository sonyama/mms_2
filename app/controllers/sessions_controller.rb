class SessionsController < ApplicationController
  
  before_action :log_update, only: [:destroy]
  after_action :log_update, only: [:create]
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      if current_user.admin? 
        redirect_to admin_users_path
      else
        redirect_to root_url
      end
    else
      flash[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
  
end
