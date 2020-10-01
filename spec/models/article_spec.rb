require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'associations' do
    it 'should have many categories' do
      article = Article.reflect_on_association(:categories)
      expect(article.macro).to eq(:has_many)
    end
    it 'should many votes' do
      article = Article.reflect_on_association(:votes)
      expect(article.macro).to eq(:has_many)
    end
  end
end
