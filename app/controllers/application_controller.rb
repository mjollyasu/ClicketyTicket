class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include UsersHelper
  
  
  #before_filter :require_login

private

  def require_login
    unless $current_user
      #redirect_to root_url
    end
  end

 

end
