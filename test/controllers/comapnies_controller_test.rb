require 'test_helper'

class ComapniesControllerTest < ActionController::TestCase
  setup do
    @comapny = comapnies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comapnies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comapny" do
    assert_difference('Comapny.count') do
      post :create, comapny: { industry: @comapny.industry, location: @comapny.location, name: @comapny.name }
    end

    assert_redirected_to comapny_path(assigns(:comapny))
  end

  test "should show comapny" do
    get :show, id: @comapny
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comapny
    assert_response :success
  end

  test "should update comapny" do
    patch :update, id: @comapny, comapny: { industry: @comapny.industry, location: @comapny.location, name: @comapny.name }
    assert_redirected_to comapny_path(assigns(:comapny))
  end

  test "should destroy comapny" do
    assert_difference('Comapny.count', -1) do
      delete :destroy, id: @comapny
    end

    assert_redirected_to comapnies_path
  end
end
