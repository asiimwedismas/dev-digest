require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  describe 'User Registration' do
    it 'Sign up should succeed' do
      visit signup_path
      within('form') do
        fill_in 'Name', with: 'dismas_test_name'
      end
      click_button 'Sign up'
      expect(page).to have_content 'User Logged in'
    end
  end
end
