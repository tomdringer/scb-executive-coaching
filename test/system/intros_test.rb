require "application_system_test_case"

class IntrosTest < ApplicationSystemTestCase
  setup do
    @intro = intros(:one)
  end

  test "visiting the index" do
    visit intros_url
    assert_selector "h1", text: "Intros"
  end

  test "should create intro" do
    visit intros_url
    click_on "New intro"

    fill_in "Body", with: @intro.body
    fill_in "Title", with: @intro.title
    click_on "Create Intro"

    assert_text "Intro was successfully created"
    click_on "Back"
  end

  test "should update Intro" do
    visit intro_url(@intro)
    click_on "Edit this intro", match: :first

    fill_in "Body", with: @intro.body
    fill_in "Title", with: @intro.title
    click_on "Update Intro"

    assert_text "Intro was successfully updated"
    click_on "Back"
  end

  test "should destroy Intro" do
    visit intro_url(@intro)
    click_on "Destroy this intro", match: :first

    assert_text "Intro was successfully destroyed"
  end
end
