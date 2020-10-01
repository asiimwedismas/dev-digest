class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
    @categories = Category.all
  end

  def create
    current_user = User.find(2)
    @article = current_user.articles.build(article_params)

    respond_to do |format|
      if @article.save
        selected_category = Category.find(params[:category_id])
        @article.article_categories.create(category: selected_category)
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :image)
  end
end
