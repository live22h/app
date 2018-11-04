json.extract! post, :id, :title_id, :message, :email, :branch_id, :created_at, :updated_at
json.url post_url(post, format: :json)
