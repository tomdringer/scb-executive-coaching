json.extract! service, :id, :title, :body, :created_at, :hide_title, :title_colour, :title_size, :body_text_colour, :body_text_size, :link_colour, :background_colour, :photo_one, :photo_two
json.url service_url(service, format: :json)
