class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def deny_access_if_not_logged_in
    if current_user.nil?
      redirect_to root_path
    end
  end

  def deny_access_for_non_admins
    deny_access_if_not_logged_in()
    if !current_user.is_role_by_name?('admin')
      redirect_to root_path
    end
  end
end
