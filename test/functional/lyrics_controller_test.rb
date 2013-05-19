require 'test_helper'

class LyricsControllerTest < ActionController::TestCase
  setup do
    @lyric = lyrics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lyrics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lyric" do
    assert_difference('Lyric.count') do
      post :create, lyric: { artist: @lyric.artist, content: @lyric.content, lyrics: @lyric.lyrics, title: @lyric.title }
    end

    assert_redirected_to lyric_path(assigns(:lyric))
  end

  test "should show lyric" do
    get :show, id: @lyric
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lyric
    assert_response :success
  end

  test "should update lyric" do
    put :update, id: @lyric, lyric: { artist: @lyric.artist, content: @lyric.content, lyrics: @lyric.lyrics, title: @lyric.title }
    assert_redirected_to lyric_path(assigns(:lyric))
  end

  test "should destroy lyric" do
    assert_difference('Lyric.count', -1) do
      delete :destroy, id: @lyric
    end

    assert_redirected_to lyrics_path
  end
end
