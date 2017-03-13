json.array!(@fotds) do |fotd|
  json.extract! fotd, :id, :fact_id
  json.url fotd_url(fotd, format: :json)
end
