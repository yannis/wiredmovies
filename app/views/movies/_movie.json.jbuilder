# frozen_string_literal: true

json.extract! movie, :id, :name, :director, :released_on, :image_url, :description, :created_at, :updated_at
json.url movie_url(movie, format: :json)
