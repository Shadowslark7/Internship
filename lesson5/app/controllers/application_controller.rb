class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  
  rescue_from CanCan::AccessDenied do |exception|
      flash[:error] = "Access denied."
    redirect_to root_url
  end
end
