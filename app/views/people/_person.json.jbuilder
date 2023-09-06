json.extract! person, :id, :name, :title, :content, :created_at, :updated_at
json.url person_url(person, format: :json)
