json.array!(@wall_posts) do |wall_post|
  json.extract! wall_post, :id, :person_id, :text, :date
  json.url wall_post_url(wall_post, format: :json)
end
