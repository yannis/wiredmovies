Review.destroy_all
Movie.destroy_all
Review.connection.execute("ALTER SEQUENCE reviews_id_seq RESTART WITH 1")
Movie.connection.execute("ALTER SEQUENCE movies_id_seq RESTART WITH 1")

file = File.read(Rails.root.join("db", "seed_movies.json"))
movies_data = JSON.parse(file)

ActiveRecord::Base.transaction do
  movies_data.each do |movie_data|
    Movie.create!(
      name: movie_data.fetch("name"),
      director: movie_data.fetch("director"),
      released_on: Date.parse(movie_data.fetch("released")),
      image_url: movie_data.fetch("image"),
      description: movie_data.fetch("description"),
      reviews: movie_data.fetch("reviews").map do |review_data|
        Review.new(review_data)
      end
    )
  end
end
