module ApplicationHelper
  def user_loggedin?
    !session[:current_user_id].nil?
  end

  def current_user
    User.find(session[:current_user_id]) if user_loggedin?
  end
end
