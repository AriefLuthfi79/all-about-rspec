class SessionsController < Devise::SessionsController

  protected

  def after_sign_in_path_for(resource)
    admin_users_path
  end
end
