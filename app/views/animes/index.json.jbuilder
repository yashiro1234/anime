json.array!(@animes) do |anime|
  json.extract! anime, :id, :name, :url
  json.url anime_url(anime, format: :json)
end
