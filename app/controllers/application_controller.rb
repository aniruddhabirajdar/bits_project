class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    render :file => "#{Rails.root}/public/403.html", :status => 403, :layout => false
  end

  def after_sign_in_path_for(resource)
    if current_user && (current_user.role? :admin)
      rails_admin_path
    else
      request.env['omniauth.origin'] || stored_location_for(resource) || root_path
    end
  end

end
