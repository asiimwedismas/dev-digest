require "application_system_test_case"

class ArticleCategoriesTest < ApplicationSystemTestCase
  setup do
    @article_category = article_categories(:one)
  end

  test "visiting the index" do
    visit article_categories_url
    assert_selector "h1", text: "Article Categories"
  end

  test "creating a Article category" do
    visit article_categories_url
    click_on "New Article Category"

    fill_in "Article", with: @article_category.article_id
    fill_in "Category", with: @article_category.category_id
    click_on "Create Article category"

    assert_text "Article category was successfully created"
    click_on "Back"
  end

  test "updating a Article category" do
    visit article_categories_url
    click_on "Edit", match: :first

    fill_in "Article", with: @article_category.article_id
    fill_in "Category", with: @article_category.category_id
    click_on "Update Article category"

    assert_text "Article category was successfully updated"
    click_on "Back"
  end

  test "destroying a Article category" do
    visit article_categories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Article category was successfully destroyed"
  end
end
