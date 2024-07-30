json.extract! blog, :id, :title, :body, :category, :created_at, :updated_at
json.url blog_url(blog, format: :json)
