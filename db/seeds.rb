# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Movie.create([
#   { title: 'Inception', description: 'A mind-bending thriller about dreams within dreams.' },
#   { title: 'The Matrix', description: 'A hacker learns the shocking truth about reality.' },
#   { title: 'Interstellar', description: 'A team of explorers venture into space to save mankind.' }
# ])

require 'open-uri'
Movie.destroy_all
# List.destroy_all

# the Le Wagon copy of the API
url = 'http://tmdb.lewagon.com/movie/top_rated'
response = JSON.parse(URI.open(url).read)

response['results'].each do |movie_hash|

  p movie_hash
  # create an instance with the hash
  Movie.create!(
    poster_url: "https://image.tmdb.org/t/p/w500" + movie_hash['poster_path'], title: movie_hash["original_title"], overview:movie_hash["overview"], rating:movie_hash["vote_average"]

  )
end
