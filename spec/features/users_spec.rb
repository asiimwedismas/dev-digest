require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  describe 'Authentication' do
    # before :each do
    #   User.new(name: 'dismas').save
    # end

    it 'log in should succeed' do
      User.new(name: 'dismas').save
      visit login_path
      click_link 'login'
      expect(page).to have_content 'User Logged in'
    end

    it 'Sign up should succed' do
      visit signup_path
      within('form') do
        fill_in 'Name', with: 'dismas_test_name'
      end
      click_button 'Create User'
      expect(page).to have_content 'User was successfully created.'
    end
  end
end
