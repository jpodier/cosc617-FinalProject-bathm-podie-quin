require 'test_helper'

class WallPostsControllerTest < ActionController::TestCase
  setup do
    @wall_post = wall_posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wall_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wall_post" do
    assert_difference('WallPost.count') do
      post :create, wall_post: { date: @wall_post.date, person: @wall_post.person, text: @wall_post.text }
    end

    assert_redirected_to wall_post_path(assigns(:wall_post))
  end

  test "should show wall_post" do
    get :show, id: @wall_post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wall_post
    assert_response :success
  end

  test "should update wall_post" do
    patch :update, id: @wall_post, wall_post: { date: @wall_post.date, person: @wall_post.person, text: @wall_post.text }
    assert_redirected_to wall_post_path(assigns(:wall_post))
  end

  test "should destroy wall_post" do
    assert_difference('WallPost.count', -1) do
      delete :destroy, id: @wall_post
    end

    assert_redirected_to wall_posts_path
  end
end
