class CitiesController < ApplicationController
    before_action :set_city, only: [:show]

    def index
         @cities = City.all
         respond_to do |format|
             format.html # index.html.erb
             format.json { render :json => @cities }
         end
    end

    def show
        @cities = City.where(movie_id: @movie)
    end

    private

    def set_city
        @city = City.find(params[:id])
    end

    def city_params
      params.require(:city).permit(
      :city_id,
      :city,
      )
    end
end
