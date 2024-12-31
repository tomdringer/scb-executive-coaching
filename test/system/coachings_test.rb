require "application_system_test_case"

class CoachingsTest < ApplicationSystemTestCase
  setup do
    @coaching = coachings(:one)
  end

  test "visiting the index" do
    visit coachings_url
    assert_selector "h1", text: "Coachings"
  end

  test "should create coaching" do
    visit coachings_url
    click_on "New coaching"

    fill_in "Description", with: @coaching.description
    fill_in "Title", with: @coaching.title
    click_on "Create Coaching"

    assert_text "Coaching was successfully created"
    click_on "Back"
  end

  test "should update Coaching" do
    visit coaching_url(@coaching)
    click_on "Edit this coaching", match: :first

    fill_in "Description", with: @coaching.description
    fill_in "Title", with: @coaching.title
    click_on "Update Coaching"

    assert_text "Coaching was successfully updated"
    click_on "Back"
  end

  test "should destroy Coaching" do
    visit coaching_url(@coaching)
    click_on "Destroy this coaching", match: :first

    assert_text "Coaching was successfully destroyed"
  end
end
