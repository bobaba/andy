json.extract! event, :id, :name, :location, :latitude, :longitude, :description, :start_time, :end_time, :created_at, :updated_at
json.url event_url(event, format: :json)