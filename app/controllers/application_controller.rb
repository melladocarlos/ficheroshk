class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  def record_not_found
  render :file => 'public/404.html', :status => :not_found, :layout => false
  # ....
  	 true
  end




private

def current_user
  @current_user ||= Ficha.find(session[:ficha_id]) if session[:ficha_id]
end
end
