module ApplicationHelper
  def after_sign_in_path_for(resource)
    if current_user.is_graduate
      #graduate path
      graduate_path
    else
      #admin path
      admin_path
    end
  end
end
