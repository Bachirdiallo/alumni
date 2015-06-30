json.array!(@graduations) do |graduation|
  json.extract! graduation, :id
  json.url graduation_url(graduation, format: :json)
end
