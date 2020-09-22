module ApplicationHelper
  def user_loggedin?
    !session[:current_user_id].nil?
  end

  def current_user
    User.find(1) if user_loggedin?
  end
end
