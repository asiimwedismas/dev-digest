require 'application_system_test_case'

class CategoriesTest < ApplicationSystemTestCase
  setup do
    @category = categories(:one)
  end

  test 'visiting the index' do
    visit categories_url
    assert_selector 'h1', text: 'Categories'
  end

  test 'creating a Category' do
    visit categories_url
    click_on 'New Category'

    fill_in 'Name', with: @category.name
    fill_in 'Priority', with: @category.priority
    click_on 'Create Category'

    assert_text 'Category was successfully created'
  end
end
