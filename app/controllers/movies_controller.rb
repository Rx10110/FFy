class MoviesController < ApplicationController
    before_action :set_movie, only: [:show]

    def index
        @movies = Movie.all
        respond_to do |format|
            format.html # index.html.erb
            format.json { render :json => @movies }
        end
    end

    def new
        @movie = Movie.new
    end

    def show
    end

    def import
        Movie.import(params[:file])
        # redirection to the index after the import
        redirect_to action: :index
    end


    private

    def set_movie
        @movie = Movie.find(params[:id])
    end

    def film_params
        params.require(:movie).permit(
        :id,
        :title,
        :distributor,
        :release_date,
        :weeks,
        :number_of_copies,
        :spectators_per_week,
        :total_spectators,
        :satisfaction_rate
        )
    end
end
