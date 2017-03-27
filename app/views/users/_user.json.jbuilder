json.extract! user, :id, :password_digest, :session_token, :username, :created_at, :updated_at
json.url user_url(user, format: :json)
