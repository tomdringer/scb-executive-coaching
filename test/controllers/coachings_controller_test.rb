require "test_helper"

class CoachingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coaching = coachings(:one)
  end

  test "should get index" do
    get coachings_url
    assert_response :success
  end

  test "should get new" do
    get new_coaching_url
    assert_response :success
  end

  test "should create coaching" do
    assert_difference("Coaching.count") do
      post coachings_url, params: { coaching: { description: @coaching.description, title: @coaching.title } }
    end

    assert_redirected_to coaching_url(Coaching.last)
  end

  test "should show coaching" do
    get coaching_url(@coaching)
    assert_response :success
  end

  test "should get edit" do
    get edit_coaching_url(@coaching)
    assert_response :success
  end

  test "should update coaching" do
    patch coaching_url(@coaching), params: { coaching: { description: @coaching.description, title: @coaching.title } }
    assert_redirected_to coaching_url(@coaching)
  end

  test "should destroy coaching" do
    assert_difference("Coaching.count", -1) do
      delete coaching_url(@coaching)
    end

    assert_redirected_to coachings_url
  end
end
