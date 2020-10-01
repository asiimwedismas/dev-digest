class CategoriesController < ApplicationController
  include ApplicationHelper
  before_action :set_category, :authenticate, only: %i[show edit update destroy]
  before_action :authenticate, only: %i[new create]

  def index
    @categories = Category.all
    most_popular_artcile_id = Vote.vote_count.max_by { |_k, v| v }[0]
    @most_popluar_article = Article.find(most_popular_artcile_id)
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
