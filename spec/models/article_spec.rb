require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'validations' do
    before :each do
      @author = User.new(name: 'dismas')
      @author.save
    end

    it 'title must be present' do
      article = Article.new(author: @author,
                            title: '',
                            text: 'article text',
                            image: 'www.image.com').save
      expect(article).to eq(false)
    end

    it 'content must be present' do
      article = Article.new(author: @author,
                            title: 'my title',
                            text: '',
                            image: 'www.image.com').save
      expect(article).to eq(false)
    end

    it 'image url must be present' do
      article = Article.new(author: @author,
                            title: 'my title',
                            text: 'content',
                            image: '').save
      expect(article).to eq(false)
    end
  end

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
