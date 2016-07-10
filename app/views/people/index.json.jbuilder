json.array!(@people) do |person|
  json.extract! person, :id, :name, :email, :interests, :hobbies, :status, :relationship
  json.url person_url(person, format: :json)
end
