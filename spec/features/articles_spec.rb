require 'rails_helper'

RSpec.feature 'Articles', type: :feature do
  describe 'Article manipulation' do
    before :each do
      User.new(name: 'dismas').save
      Category.new(name: 'technology', priority: 1).save
      Category.new(name: 'web', priority: 2).save
      Category.new(name: 'technology', priority: 3).save
      visit login_path
      click_link 'login'
    end

    it 'should create an article' do
      click_link 'note_add'
      within('form') do
        fill_in 'Title', with: 'Title'
        fill_in 'Text', with: 'text'
        fill_in 'Add image URL', with: 'social.png'
        select 'web', from: 'category_id'
        click_button 'Publish'
      end

      expect(page).to have_content 'Article was successfully created.'
    end

    it 'should update an article' do
      click_link 'note_add'
      within('form') do
        fill_in 'Title', with: 'Title'
        fill_in 'Text', with: 'text'
        fill_in 'Add image URL', with: 'social.png'
        select 'web', from: 'category_id'
        click_button 'Publish'
      end

      click_link 'Edit Article'
      within('form') do
        fill_in 'Title', with: 'Title Edited'
        fill_in 'Text', with: 'text Edited'
        fill_in 'Add image URL', with: 'social.png'
        select 'web', from: 'category_id'
        click_button 'Publish'
      end

      expect(Article.last.title).to eq('Title Edited')
    end
  end
end
