json.array!(@kinds) do |kind|
  json.extract! kind, :name, :latin_name, :user_id
  json.url kind_url(kind, format: :json)
end
