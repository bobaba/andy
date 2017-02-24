json.extract! resource_attachment, :id, :resource_id, :picture, :created_at, :updated_at
json.url resource_attachment_url(resource_attachment, format: :json)