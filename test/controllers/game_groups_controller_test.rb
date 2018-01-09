require 'test_helper'

class GameGroupsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get game_groups_index_url
    assert_response :success
  end

end
