City.create!([
  {city_id: 1, city: "France", title: "Movie_Test", movie_id: 1}
])
City::HABTM_Movies.create!([
  {city_id: 1, movie_id: 1},
  {city_id: 2, movie_id: 1},
  {city_id: 2, movie_id: 1}
])
Movie.create!([
  {movie_id: 1, title: "Movie_Test", distributor: "Miramax", release_date: "2016-03-03", weeks: 1, number_of_copies: 120, spectators_per_week: 2000, total_spectators: 2000, satifaction_rate: 55, city: "France"},
  {movie_id: 2, title: "Deapool", distributor: "20 Century Fox", release_date: "2016-02-10", weeks: 4, number_of_copies: 478, spectators_per_week: 2000, total_spectators: 1284278, satifaction_rate: 57, city: "France"}
])
Movie::HABTM_Cities.create!([
  {city_id: 1, movie_id: 1},
  {city_id: 2, movie_id: 1},
  {city_id: 2, movie_id: 1}
])
