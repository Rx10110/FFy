class Movie < ActiveRecord::Base
    has_many :cities_movies
    has_many :cities, :through => :cities_movies

    # choosing which row is going in which column in the database and translating the columns names to english
    MAPPING = {
        "titre" => "title",
        "distrib" => "distributor",
        "nb de sem" => "weeks",
        "nb copies" => "number_of_copies",
        "entrées" => "spectators_per_week",
        "cumulFrance" => "total_spectators",
        "Taux de hte sat." => "satisfaction_rate"
        # didnt had the column realease_date it's not in the file uploading file
        #just had it here when you'll have it and dont forget to had it under as well.
    }

    def self.import(file)
        spreadsheet = open_spreadsheet(file)
        header = spreadsheet.row(1)
        # starting values reading from line 3 since line 2 is an empty line
        (3..spreadsheet.last_row).each do |i|
            row = Hash[[header, spreadsheet.row(i)].transpose]
            # Convert the keys from the csv/xls to match the database column names
            row.keys.each { |k| row[ MAPPING[k] ] = row.delete(k) if MAPPING[k] }

            # check if the title already exists in the database to override its previous values
            m = Movie.find_or_initialize_by(title: row[ 'title' ])
            m.distributor = row[ 'distributor' ]
            m.weeks = row[ 'weeks' ]
            m.number_of_copies = row[ 'number_of_copies' ]
            m.spectators_per_week = row[ 'spectators_per_week' ]
            m.total_spectators = row[ 'total_spectators' ]
            m.satisfaction_rate = row[ 'satisfaction_rate' ].to_f
            m.save

            #add the city "France" to the movie created
            CitiesMovie.create(city_id: 1, movie_id: m.id)
        end
    end

    def self.open_spreadsheet(file)
        case File.extname(file.original_filename)
        when ".csv" then Roo::CSV.new(file.path)
        when ".xls" then Roo::Excel.new(file.path)
        when ".xlsx" then Roo::Excelx.new(file.path)
        else raise "Unknown file type: #{file.original_filename}"
        end
    end

end
