class CitiesMovie < ActiveRecord::Base
  belongs_to :movie
  belongs_to :city
end
