class CitiesMoviesController < ApplicationController
    before_action :set_movies, :set_cities
        
    def index
    end

    def show
        @movies = Movie.where(city_id: @city)
    end

    private

    def set_movies
        @movies = Movie.find(params[:id])
    end

    def set_cities
        @cities = City.find(params[:id])
    end

    def params
        params.require(:cities_movies).permit(
        :city_id,
        :movie_id
        )
    end

end
