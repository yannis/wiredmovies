Review.destroy_all
Movie.destroy_all
User.destroy_all
Review.connection.execute("ALTER SEQUENCE reviews_id_seq RESTART WITH 1")
Movie.connection.execute("ALTER SEQUENCE movies_id_seq RESTART WITH 1")
User.connection.execute("ALTER SEQUENCE users_id_seq RESTART WITH 1")

users_data = [
  {
    name: "John 'admin' Doe",
    email: "john.doe@test.com",
    password: "password",
    admin: true
  },
  {
    name: "Richard Miles",
    email: "richard.miles@test.com",
    password: "password",
    admin: false
  }
]

file = File.read(Rails.root.join("db", "seed_movies.json"))
movies_data = JSON.parse(file)

ActiveRecord::Base.transaction do
  users_data.each do |user_data|
    User.create!(user_data)
  end
  movies_data.each do |movie_data|
    Movie.create!(
      name: movie_data.fetch("name"),
      director: movie_data.fetch("director"),
      released_on: Date.parse(movie_data.fetch("released")),
      image_url: movie_data.fetch("image"),
      description: movie_data.fetch("description"),
      reviews: movie_data.fetch("reviews").map do |review_data|
        Review.new(review_data.merge!(user: User.all.sample))
      end
    )
  end
end
