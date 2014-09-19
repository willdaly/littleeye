class AddGuessesToMissions < ActiveRecord::Migration
  def change
    add_column :missions, :guesses, :integer
  end
end
