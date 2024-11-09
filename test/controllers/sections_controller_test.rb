require "test_helper"

class SectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @section = sections(:one)
  end

  test "should get index" do
    get sections_url
    assert_response :success
  end

  test "should get new" do
    get new_section_url
    assert_response :success
  end

  test "should create section" do
    assert_difference("Section.count") do
      post sections_url, params: { section: { body: @section.body, title: @section.title, name: @section.name, background_colour: @section.background_colour, order: @section.order, reviews: @section.reviews, title_size: @section.title_size, title_colour: @section.title_colour, hide_title: @section.hide_title, hide_menu: @section.hide_menu } }
    end

    assert_redirected_to root_url
  end

  test "should show section" do
    get section_url(@section)
    assert_response :success
  end

  test "should get edit" do
    get edit_section_url(@section)
    assert_response :success
  end

  test "should update section" do
    patch section_url(@section), params: { section: { body: @section.body, title: @section.title } }
    assert_redirected_to root_url
  end

  test "should destroy section" do
    assert_difference("Section.count", -1) do
      delete section_url(@section)
    end

    assert_redirected_to root_url
  end
end
