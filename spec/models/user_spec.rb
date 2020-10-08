require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'name must be present' do
      user = User.new(name: 'dismas').save
      expect(user).to eq(true)
    end

    it 'name must be unique' do
      User.new(name: 'dismas').save
      user2 = User.new(name: 'dismas').save
      expect(user2).to eq(false)
    end
  end

  context 'associations' do
    it 'should have many articles' do
      user_x = User.reflect_on_association(:articles)
      expect(user_x.macro).to eq(:has_many)
    end

    it 'should have many votes' do
      user_x = User.reflect_on_association(:votes)
      expect(user_x.macro).to eq(:has_many)
    end
  end
end
