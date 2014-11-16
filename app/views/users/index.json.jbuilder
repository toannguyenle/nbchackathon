json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :password, :password_confirmation, :favorite_movies
  json.url user_url(user, format: :json)
end
