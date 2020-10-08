require 'rails_helper'

RSpec.describe Vote, type: :model do
  context 'associations' do
    it 'should belong to a user' do
      vote = Vote.reflect_on_association(:user)
      expect(vote.macro).to eq(:belongs_to)
    end
    it 'should belong to an article' do
      vote = Vote.reflect_on_association(:article)
      expect(vote.macro).to eq(:belongs_to)
    end
  end
end
