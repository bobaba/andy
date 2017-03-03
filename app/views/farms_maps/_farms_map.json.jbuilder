json.extract! farms_map, :id, :name, :address, :latitude, :longitude, :description, :created_at, :updated_at
json.url farms_map_url(farms_map, format: :json)