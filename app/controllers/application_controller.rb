class ApplicationController < ActionController::Base
# before_action :authenticate_admin!, if: :admin_url
 before_action :configure_permitted_parameters, if: :devise_controller?

  #def admin_url
   # request.fullpath.include?("/admin")
  #end

  def after_sign_in_path_for(resource)
    #case resource
    #when Admin
     # admin_root_path
    #when Customer
      posts_path
  end
  #end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name,:first_name,:kana_last_name,:kana_first_name,
    :zipcode, :address, :phone_number, :email, :password,:delete_flag, :username])
  end
end
