json.array!(@comapnies) do |comapny|
  json.extract! comapny, :id, :name, :location, :industry
  json.url comapny_url(comapny, format: :json)
end
