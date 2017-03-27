json.extract! post, :id, :title, :url, :user_id, :sub_id, :content, :created_at, :updated_at
json.url post_url(post, format: :json)
