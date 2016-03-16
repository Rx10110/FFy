class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
        t.string :title, index: :unique
        t.string :distributor
        t.date     :release_date
        t.integer  :weeks
        t.integer  :number_of_copies
        t.integer  :spectators_per_week
        t.integer  :total_spectators
        t.integer  :satisfaction_rate
    end
  end
end
