json.array!(@titles) do |title|
  json.extract! title, :id, :tid, :title, :short_title, :title_yomi, :title_en, :comment, :cat, :title_flag, :first_year, :first_month, :first_end_year, :first_end_month, :first_chid, :keywords, :user_point, :user_point_rank, :last_update
  json.url title_url(title, format: :json)
end
