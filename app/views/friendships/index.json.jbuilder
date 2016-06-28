json.array!(@friendships) do |friendship|
  json.extract! friendship, :id, :requester_id, :granter_id, :accepted
  json.url friendship_url(friendship, format: :json)
end
