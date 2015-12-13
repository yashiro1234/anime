json.array!(@anime_staff_rolls) do |anime_staff_roll|
  json.extract! anime_staff_roll, :id, :name, :name_yomi
  json.url anime_staff_roll_url(anime_staff_roll, format: :json)
end
