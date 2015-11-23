require 'test_helper'

class StorefrontControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test 'should render a panel for every product' do
    get :index
    assert_select '.panel', 2
  end

end
