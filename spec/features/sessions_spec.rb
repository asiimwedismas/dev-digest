require 'rails_helper'

RSpec.feature 'Sessions', type: :feature do
  describe 'Authentication' do
    it 'log in should succeed' do
      User.new(name: 'dismas').save
      visit login_path
      click_link 'login'
      expect(page).to have_content 'User Logged in'
    end
  end
end
