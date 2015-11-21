require 'test_helper'

class AnimeStaffTest < ActiveSupport::TestCase
  test "saveStaff実行" do
    animeStaff = AnimeStaff.new
    id = animeStaff.saveStaff("てすと")
    lastResult = AnimeStaff.order(id: :desc).last
    assert_equal lastResult.id, id, "最新のIDを取得できませんでした"
  end
end
