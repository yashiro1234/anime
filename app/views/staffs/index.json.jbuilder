json.array!(@anime_staffs) do |anime_staff|
  json.extract! anime_staff, :id, :name, :name_yomi
  json.url anime_staff_url(anime_staff, format: :json)
end
