json.array!(@anime_titles) do |anime_title|
  json.extract! anime_title, :id, :tid, :title, :short_title, :title_yomi, :title_en, :comment, :cat, :title_flag, :first_year, :first_month, :first_end_year, :first_end_month, :first_chid, :keywords, :user_point, :user_point_rank, :last_update
  json.url anime_title_url(anime_title, format: :json)
end
