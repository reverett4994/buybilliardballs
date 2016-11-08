require 'test_helper'

class BallsControllerTest < ActionController::TestCase
  setup do
    @ball = balls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:balls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ball" do
    assert_difference('Ball.count') do
      post :create, ball: { 10: @ball.10, 4: @ball.4, color: @ball.color, number: @ball.number, price: @ball.price, title: @ball.title }
    end

    assert_redirected_to ball_path(assigns(:ball))
  end

  test "should show ball" do
    get :show, id: @ball
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ball
    assert_response :success
  end

  test "should update ball" do
    patch :update, id: @ball, ball: { 10: @ball.10, 4: @ball.4, color: @ball.color, number: @ball.number, price: @ball.price, title: @ball.title }
    assert_redirected_to ball_path(assigns(:ball))
  end

  test "should destroy ball" do
    assert_difference('Ball.count', -1) do
      delete :destroy, id: @ball
    end

    assert_redirected_to balls_path
  end
end
