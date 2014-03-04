module SessionsHelper

  def is_admin?
    if current_user.nil?
      false
    else
      current_user.is_role_by_name?('admin')
    end
  end

end