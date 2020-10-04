module ArticlesHelper
  def vote_or_unvote_btn(article)
    return if session[:current_user_id].nil?

    vote = Vote.find_by(article: article, user: current_user)
    if vote
      link_to('Un-vote!',
              article_vote_path(id: vote.id, article_id: article.id),
              method: :delete,
              class: 'btn btn-danger')
    else
      link_to('Vote!', article_votes_path(article_id: article.id), method: :post, class: 'btn btn-success')
    end
  end

  def link_to_edit_article(article)
    return if session[:current_user_id] != article.author.id

    link_to('Edit Article', edit_article_path(article), class: 'btn btn-link')
  end
end
