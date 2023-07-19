# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'
require 'json'

puts 'Starting seed...'

url = 'https://tmdb.lewagon.com/movie/top_rated'
poster = 'https://image.tmdb.org/t/p/original/'
json_data = URI.open(url).read
movies_data = JSON.parse(json_data)

movies_data.each do |movie_data|
  Movie.create(
    title: movie_data['original_title'],
    overview: movie_data['overview'],
    poster_url: poster + movie_data['poster_path'],
    rating: movie_data['vote_average']
  )
end

movies_seeded = movies_data.length
puts "Seed completed! Seeded #{movies_seeded} movies."
