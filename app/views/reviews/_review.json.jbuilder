json.extract! review, :id, :movie_id, :title, :body, :author, :created_at, :updated_at
json.url review_url(review, format: :json)
