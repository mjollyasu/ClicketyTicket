class SessionsController < ApplicationController
 
  #skip_before_filter :require_login, :except=>[:new, :create, :destroy]
  
  def new
  end
  
  def create 
     user = User.find_by(name: params[:session][:name].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = "Invalid email/password combination"
      render 'new'
    end
  end 
  
  def destroy
    log_out
    redirect_to root_url
  end
  
end
