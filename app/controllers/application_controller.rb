class ApplicationController < ActionController::Base
  

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nick_name, :encrypted_password, :email, :last_name, :last_name_kana, :first_name,
                                             :first_name_kana, :birth_date])
  end
end
