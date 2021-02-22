class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(_resource)
    user_path(current_user, status: 'new')
  end
end
