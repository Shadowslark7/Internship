class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    flash[:notice] = "Куда лезет этот новичок, глянь (Куда он лезет?)"
    redirect_to root_url
  end
end
