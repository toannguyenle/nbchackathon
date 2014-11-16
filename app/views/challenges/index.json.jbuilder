json.array!(@challenges) do |challenge|
  json.extract! challenge, :id, :ticket, :trailer, :checkin, :quiz, :fblike, :fbshare, :tfollow, :tweet
  json.url challenge_url(challenge, format: :json)
end
