module ApplicationHelper
  def active_link(link_path)
    current_page?(link_path) ? 'active' : ''
  end

  def user_loggedin?
    !session[:current_user_id].nil?
  end

  def current_user
    User.find(session[:current_user_id]) if user_loggedin?
  end

  def get_all_categories
    @categories = Category.all
  end

  def authenticate
    redirect_to login_path if session[:current_user_id].nil?
  end
end
