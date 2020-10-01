class VotesController < ApplicationController
  include ApplicationHelper

  def create
    @vote = current_user.votes.new(article_id: params[:article_id])

    if @vote.save
      redirect_to article_path(params[:article_id]), notice: 'You voted for this post.'
    else
      redirect_to article_path(params[:article_id]), alert: 'You cannot vote this post.'
    end
  end

  def destroy
    vote = Vote.find_by(id: params[:id], user: current_user, article_id: params[:article_id])
    if vote
      vote.destroy
      redirect_to article_path(params[:article_id]), notice: 'You unvoted this post.'
    else
      redirect_to article_path(params[:article_id]), alert: 'You cannot unvote post that you did not vote before.'
    end
  end

end
