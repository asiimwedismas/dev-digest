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

  def all_categories
    @categories = Category.all
  end

  def authenticate
    redirect_to login_path if session[:current_user_id].nil?
  end

  def login_links
    links_string = ''

    if !user_loggedin?
      links_string = links_string + link_to('LOGIN', login_path) + ' | ' + link_to('REGISTER', signup_path)
    else
      icon = '<i class="material-icons">note_add</i>'.html_safe
      links_string += link_to(icon, new_article_path, class: 'orange_link')
      links_string = links_string + link_to(current_user.name, user_path(current_user)) + ' | ' + link_to('log out', logout_path)
    end
    links_string.html_safe
  end
end
