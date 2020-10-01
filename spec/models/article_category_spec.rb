require 'rails_helper'

RSpec.describe ArticleCategory, type: :model do
  context 'associations' do
    it 'should belong to a category' do
      article_category = ArticleCategory.reflect_on_association(:category)
      expect(article_category.macro).to eq(:belongs_to)
    end
    it 'should should belong to an article' do
      article_category = ArticleCategory.reflect_on_association(:article)
      expect(article_category.macro).to eq(:belongs_to)
    end
  end
end
