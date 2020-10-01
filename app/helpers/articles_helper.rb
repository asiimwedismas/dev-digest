module ArticlesHelper
  def vote_or_unvote_btn(article)
    vote = Vote.find_by(article: article, user: current_user)
    if vote
      link_to('Un-vote!', article_vote_path(id: vote.id, article_id: article.id), method: :delete, class: 'btn')
    else
      link_to('Vote!', article_votes_path(article_id: article.id), method: :post, class: 'btn')
    end
  end
end
