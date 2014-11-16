json.array!(@movies) do |movie|
  json.extract! movie, :id, :name, :fandango_id
  json.url movie_url(movie, format: :json)
end
