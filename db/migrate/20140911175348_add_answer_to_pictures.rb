class AddAnswerToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :answer, :boolean
  end
end
