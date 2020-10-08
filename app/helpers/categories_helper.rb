module CategoriesHelper
  def latest_article(category)
    category.articles.last
  end
end
