# test/controllers/resources_controller_test.rb
require 'test_helper'

class ResourcesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers # Include Devise integration helpers

  user = User.create!(email: 'test3@example.com', password: 'password')

  setup do
    @resource = resources(:one)
    @category = categories(:one)
    @resource_category = resource_categories(:one)

    # Ensure these files and paths exist in your test suite
    preview_path = Rails.root.join('test', 'fixtures', 'files', 'preview.jpg')
    @resource.preview.attach(io: File.open(preview_path), filename: 'preview.jpg', content_type: 'image/jpeg')
    @resource.file_upload.attach(io: File.open(preview_path), filename: 'preview.jpg', content_type: 'image/jpeg')
  end

  test 'should get index' do
    get resources_url
    assert_response :success
  end

  test 'should get new' do
    get new_resource_url
    assert_response :success
  end

  test 'should create resource' do
    assert_difference('Resource.count') do
      post resources_url, params: { resource: {
        title: 'New Title',
        body: 'New body',
        category: 'New Category',
        description: 'New description',
        link: 'New Link', preview: 'New preview',
        author: 'New Author', category_id: 1 } }
    end

    assert_redirected_to resource_url(Resource.last)
  end

  test 'should show resource' do
    get resource_url(@resource)
    assert_response :success
  end

  test 'should get edit' do
    get edit_resource_url(@resource)
    assert_response :success
  end

  test 'should update resource' do
    patch resource_url(@resource), params: { resource: { title: 'Updated Title' } }
    assert_redirected_to resource_url(@resource)
  end

  test 'should not update resource with invalid data' do
    patch resource_url(@resource), params: { resource: { title: nil } }
    assert_response :unprocessable_entity
  end

  test 'should destroy resource' do
    assert_difference('Resource.count', -1) do
      delete resource_url(@resource)
    end

    assert_redirected_to resources_url
  end
end