json.extract! video, :id, :name, :url, :views, :created_at, :updated_at
json.url video_url(video, format: :json)
