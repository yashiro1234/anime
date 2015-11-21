require 'test_helper'

class AnimeTitlesControllerTest < ActionController::TestCase
  setup do
    @anime_title = anime_titles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:anime_titles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create anime_title" do
    assert_difference('AnimeTitle.count') do
      post :create, anime_title: { cat: @anime_title.cat, comment: @anime_title.comment, first_chid: @anime_title.first_chid, first_end_month: @anime_title.first_end_month, first_end_year: @anime_title.first_end_year, first_month: @anime_title.first_month, first_year: @anime_title.first_year, keywords: @anime_title.keywords, last_update: @anime_title.last_update, short_title: @anime_title.short_title, tid: @anime_title.tid, title: @anime_title.title, title_en: @anime_title.title_en, title_flag: @anime_title.title_flag, title_yomi: @anime_title.title_yomi, user_point: @anime_title.user_point, user_point_rank: @anime_title.user_point_rank }
    end

    assert_redirected_to anime_title_path(assigns(:anime_title))
  end

  test "should show anime_title" do
    get :show, id: @anime_title
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @anime_title
    assert_response :success
  end

  test "should update anime_title" do
    patch :update, id: @anime_title, anime_title: { cat: @anime_title.cat, comment: @anime_title.comment, first_chid: @anime_title.first_chid, first_end_month: @anime_title.first_end_month, first_end_year: @anime_title.first_end_year, first_month: @anime_title.first_month, first_year: @anime_title.first_year, keywords: @anime_title.keywords, last_update: @anime_title.last_update, short_title: @anime_title.short_title, tid: @anime_title.tid, title: @anime_title.title, title_en: @anime_title.title_en, title_flag: @anime_title.title_flag, title_yomi: @anime_title.title_yomi, user_point: @anime_title.user_point, user_point_rank: @anime_title.user_point_rank }
    assert_redirected_to anime_title_path(assigns(:anime_title))
  end

  test "should destroy anime_title" do
    assert_difference('AnimeTitle.count', -1) do
      delete :destroy, id: @anime_title
    end

    assert_redirected_to anime_titles_path
  end
end
