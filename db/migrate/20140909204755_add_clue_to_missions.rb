class AddClueToMissions < ActiveRecord::Migration
  def change
    add_column :missions, :clue, :string
  end
end
