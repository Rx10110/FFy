class City < ActiveRecord::Base
    has_many :cities_movies
    has_many :movies, :through => :cities_movies
end
