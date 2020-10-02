class ArticlesController < ApplicationController
  include ApplicationHelper
  before_action :set_article, only: %i[show edit update]
  before_action :authenticate, only: %i[new edit update create]

  def show; end

  def edit
    @categories = Category.all
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        @article.article_categories.update(category_id: params[:category_id])
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def new
    @article = Article.new
    @categories = Category.all
  end

  def create
    @article = current_user.articles.build(article_params)

    respond_to do |format|
      if @article.save
        @article.article_categories.create(category_id: params[:category_id])
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text, :image)
  end
end
