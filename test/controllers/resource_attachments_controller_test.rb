require 'test_helper'

class ResourceAttachmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @resource_attachment = resource_attachments(:one)
  end

  test "should get index" do
    get resource_attachments_url
    assert_response :success
  end

  test "should get new" do
    get new_resource_attachment_url
    assert_response :success
  end

  test "should create resource_attachment" do
    assert_difference('ResourceAttachment.count') do
      post resource_attachments_url, params: { resource_attachment: { picture: @resource_attachment.picture, resource_id: @resource_attachment.resource_id } }
    end

    assert_redirected_to resource_attachment_url(ResourceAttachment.last)
  end

  test "should show resource_attachment" do
    get resource_attachment_url(@resource_attachment)
    assert_response :success
  end

  test "should get edit" do
    get edit_resource_attachment_url(@resource_attachment)
    assert_response :success
  end

  test "should update resource_attachment" do
    patch resource_attachment_url(@resource_attachment), params: { resource_attachment: { picture: @resource_attachment.picture, resource_id: @resource_attachment.resource_id } }
    assert_redirected_to resource_attachment_url(@resource_attachment)
  end

  test "should destroy resource_attachment" do
    assert_difference('ResourceAttachment.count', -1) do
      delete resource_attachment_url(@resource_attachment)
    end

    assert_redirected_to resource_attachments_url
  end
end
