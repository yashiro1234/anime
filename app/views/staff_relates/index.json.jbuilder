json.array!(@anime_staff_relates) do |anime_staff_relate|
  json.extract! anime_staff_relate, :id, :tid, :staff_id, :staff_roll_id
  json.url anime_staff_relate_url(anime_staff_relate, format: :json)
end
