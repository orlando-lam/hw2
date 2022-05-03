# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
Studio.destroy_all
Actor.destroy_all
Movie.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model.
# TODO!

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.

# Input Studios

studio = Studio.new
studio["studio"] = "Warner Bros."
studio.save

# puts "Studios: #{Studio.all.count}"

warner = Studio.find_by({"studio" => "Warner Bros."})

# Input Actors

actor = Actor.new
actor["actor_name"] = "Christian Bale"
actor.save

actor = Actor.new
actor["actor_name"] = "Michael Caine"
actor.save

actor = Actor.new
actor["actor_name"] = "Liam Neeson"
actor.save

actor = Actor.new
actor["actor_name"] = "Katie Holmes"
actor.save

actor = Actor.new
actor["actor_name"] = "Gary Oldman"
actor.save

actor = Actor.new
actor["actor_name"] = "Heath Ledger"
actor.save

actor = Actor.new
actor["actor_name"] = "Aaron Eckhart"
actor.save

actor = Actor.new
actor["actor_name"] = "Maggie Gyllenhaal"
actor.save

actor = Actor.new
actor["actor_name"] = "Tom Hardy"
actor.save

actor = Actor.new
actor["actor_name"] = "Joseph Gordon-Levitt"
actor.save

actor = Actor.new
actor["actor_name"] = "Anne Hathaway"
actor.save

# puts "Actors: #{Actor.all.count}"

cbale = Actor.find_by({"actor_name" => "Christian Bale"})
mcaine = Actor.find_by({"actor_name" => "Michael Caine"})
lneeson = Actor.find_by({"actor_name" => "Liam Neeson"})
kholmes = Actor.find_by({"actor_name" => "Katie Holmes"})
goldman = Actor.find_by({"actor_name" => "Gary Oldman"})
hledger = Actor.find_by({"actor_name" => "Heath Ledger"})
aeckhart = Actor.find_by({"actor_name" => "Aaron Eckhart"})
mgyllenhaal = Actor.find_by({"actor_name" => "Maggie Gyllenhaal"})
thardy = Actor.find_by({"actor_name" => "Tom Hardy"})
jgordonlevitt = Actor.find_by({"actor_name" => "Joseph Gordon-Levitt"})
ahathaway = Actor.find_by({"actor_name" => "Anne Hathaway"})

# Input Movies

movie = Movie.new
movie["title"] = "Batman Begins"
movie["year"] = 2005
movie["rating"] = "PG-13"
movie["studio_id"] = warner["id"]
movie.save

movie = Movie.new
movie["title"] = "The Dark Knight"
movie["year"] = 2008
movie["rating"] = "PG-13"
movie["studio_id"] = warner["id"]
movie.save

movie = Movie.new
movie["title"] = "The Dark Knight Rises"
movie["year"] = 2012
movie["rating"] = "PG-13"
movie["studio_id"] = warner["id"]
movie.save

# puts "#{Movie.all.count}"

batman_begins = Movie.find_by({"title" => "Batman Begins"})
dark_knight = Movie.find_by({"title" => "The Dark Knight"})
dark_knight_rises  = Movie.find_by({"title" => "The Dark Knight Rises"})

# Input Roles

role = Role.new
role["movie_role"] = "Bruce Wayne"
role["movie_id"] = batman_begins["id"]
role["actor_id"] = cbale["id"]
role.save

role = Role.new
role["movie_role"] = "Alfred"
role["movie_id"] = batman_begins["id"]
role["actor_id"] = mcaine["id"]
role.save

role = Role.new
role["movie_role"] = "Ra's Al Ghul"
role["movie_id"] = batman_begins["id"]
role["actor_id"] = lneeson["id"]
role.save

role = Role.new
role["movie_role"] = "Rachel Dawes"
role["movie_id"] = batman_begins["id"]
role["actor_id"] = kholmes["id"]
role.save

role = Role.new
role["movie_role"] = "Commissioner Gordon"
role["movie_id"] = batman_begins["id"]
role["actor_id"] = goldman["id"]
role.save

role = Role.new
role["movie_role"] = "Bruce Wayne"
role["movie_id"] = dark_knight["id"]
role["actor_id"] = cbale["id"]
role.save

role = Role.new
role["movie_role"] = "Joker"
role["movie_id"] = dark_knight["id"]
role["actor_id"] = hledger["id"]
role.save

role = Role.new
role["movie_role"] = "Harvey Dent"
role["movie_id"] = dark_knight["id"]
role["actor_id"] = aeckhart["id"]
role.save

role = Role.new
role["movie_role"] = "Alfred"
role["movie_id"] = dark_knight["id"]
role["actor_id"] = mcaine["id"]
role.save

role = Role.new
role["movie_role"] = "Rachel Dawes"
role["movie_id"] = dark_knight["id"]
role["actor_id"] = mgyllenhaal["id"]
role.save

role = Role.new
role["movie_role"] = "Bruce Wayne"
role["movie_id"] = dark_knight_rises["id"]
role["actor_id"] = cbale["id"]
role.save

role = Role.new
role["movie_role"] = "Commissioner Gordon"
role["movie_id"] = dark_knight_rises["id"]
role["actor_id"] = goldman["id"]
role.save

role = Role.new
role["movie_role"] = "Bane"
role["movie_id"] = dark_knight_rises["id"]
role["actor_id"] = thardy["id"]
role.save

role = Role.new
role["movie_role"] = "John Blake"
role["movie_id"] = dark_knight_rises["id"]
role["actor_id"] = jgordonlevitt["id"]
role.save

role = Role.new
role["movie_role"] = "Selina Kyle"
role["movie_id"] = dark_knight_rises["id"]
role["actor_id"] = ahathaway["id"]
role.save

# puts "#{Role.all.count}"

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.

movies = Movie.all

for movie in movies
    studio = Studio.find_by({"id" => movie["studio_id"]})
    puts "#{movie["title"]} #{movie["year"]} #{movie["rating"]} #{studio["studio"]}"
end

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.

roles = Role.all

for role in roles
    movie = Movie.find_by({"id" => role["movie_id"]})
    actor = Actor.find_by({"id" => role["actor_id"]})
    puts "#{movie["title"]} #{actor["actor_name"]} #{role["movie_role"]}"
end


