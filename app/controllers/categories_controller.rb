class CategoriesController < ApplicationController
  include ApplicationHelper
  before_action :set_category, only: %i[show new create]
  before_action :authenticate, only: %i[new create]

  def index
    @categories = Category.all
    vote_hash = Vote.vote_count
    most_popular_artcile_id = vote_hash.max_by { |_k, v| v }
    @most_popluar_article = Article.find(most_popular_artcile_id[0]) unless most_popular_artcile_id.nil?
  end

  def show
    @articles = @category.articles
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name, :priority)
  end
end
