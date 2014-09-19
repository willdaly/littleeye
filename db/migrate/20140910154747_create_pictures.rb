class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.integer :mission_id
      t.string :url
    end
  end
end
