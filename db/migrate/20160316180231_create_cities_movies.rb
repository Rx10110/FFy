class CreateCitiesMovies < ActiveRecord::Migration
  def change
    create_table :cities_movies, id:false do |t|
        t.belongs_to :city
        t.belongs_to :movie
    end
  end
end
