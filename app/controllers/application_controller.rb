class ApplicationController < ActionController::Base
  devise_group :user, contains: [:participant, :sponsor]
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  # If you have extra params to permit, append them to the sanitizer.
  def configure_permitted_parameters
    added_attrs = [:email, :password, :password_confirmation, :remember_me, :name]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource_or_scope)
    dashboard_root_path
  end

  # The path used after sign in.
  def after_sign_in_path_for(resource_or_scope)
    dashboard_root_path
  end
end
