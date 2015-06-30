json.array!(@batches) do |batch|
  json.extract! batch, :id, :month, :year
  json.url batch_url(batch, format: :json)
end
