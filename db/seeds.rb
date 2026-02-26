# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "json"
require "open-uri"

url = "https://tmdb.lewagon.com/movie/top_rated"
movies_serialized = URI.parse(url).read
movies = JSON.parse(movies_serialized)

movies_results = movies["results"]
# first_movie = movies["results"][0]
ten_movies = movies_results.first(10)

# p movies["results"]
# p first_movie
# p ten_movies


puts "################## parsing movies...."
Movie.destroy_all
# count = 0
# while count < 11

  ten_movies.each do |movie|
    if movie["original_language"] == "en"
      film = Movie.new(
        title: movie["original_title"],
        overview: movie["overview"],
        poster_url: "https://image.tmdb.org/t/p/w500/#{movie["poster_path"]}"
      )
      film.save!
      puts "title : #{movie["original_title"]} added"
    end



    #   if movie["original_language"] == "en"
    #     count = count + 1
    #     # puts movie["original_language"]
    #     puts count
    #     puts "title : #{movie["original_title"]}"
    #     puts "overview : #{movie["overview"]}"
    #     puts "poster_url : https://image.tmdb.org/t/p/w500/#{movie["poster_path"]}"
    #   else
    #     puts "pas anglais"
    #     puts count
    #   end
    # end
  end
puts "End ✅"
