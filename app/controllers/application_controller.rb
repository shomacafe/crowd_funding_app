class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :search

  def search
    @q = Project.ransack(params[:q])
    @projects = @q.result(distinct: true)
  end

  private

  def configure_permitted_parameters
    added_attrs = [ :email, :name, :password, :image, :profile, :password_confirmation ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end
end
