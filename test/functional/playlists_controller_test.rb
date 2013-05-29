require 'test_helper'

class PlaylistsControllerTest < ActionController::TestCase
  setup do
    @playlist = playlists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:playlists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create playlist" do
    assert_difference('Playlist.count') do
      post :create, playlist: { lyric_ids_list: @playlist.lyric_ids_list, name: @playlist.name }
    end

    assert_redirected_to playlist_path(assigns(:playlist))
  end

  test "should show playlist" do
    get :show, id: @playlist
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @playlist
    assert_response :success
  end

  test "should update playlist" do
    put :update, id: @playlist, playlist: { lyric_ids_list: @playlist.lyric_ids_list, name: @playlist.name }
    assert_redirected_to playlist_path(assigns(:playlist))
  end

  test "should destroy playlist" do
    assert_difference('Playlist.count', -1) do
      delete :destroy, id: @playlist
    end

    assert_redirected_to playlists_path
  end

  test "should add a lyric" do
    @lyric = lyrics(:one)
    post :add_lyric, { format: :json, id: @playlist, lyric_id: @lyric }
    assert assigns(:playlist).lyrics.last.id == @lyric.id
  end

  test "should not add lyric without lyric_id" do
    post :add_lyric, { format: :json, id: @playlist }
    assert @response.status == 400
    assert json_response['errors'].include? 'lyric_id parameter must be supplied'
  end

end
