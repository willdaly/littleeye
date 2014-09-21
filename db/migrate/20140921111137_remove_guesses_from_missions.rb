class RemoveGuessesFromMissions < ActiveRecord::Migration
  def change
    remove_column :missions, :guesses, :integer
  end
end
