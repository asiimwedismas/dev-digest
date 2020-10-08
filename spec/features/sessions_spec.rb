require 'rails_helper'

RSpec.feature 'Sessions', type: :feature do
  describe 'Authentication' do
    before :each do
      User.new(name: 'dismas').save
      visit login_path
      click_link 'login'
    end

    it 'log in should succeed' do
      expect(page).to have_content 'User Logged in'
    end

    it 'log out should succeed' do
      click_link 'log out'
      expect(page).to have_content 'Successfully logged out'
    end
  end
end
