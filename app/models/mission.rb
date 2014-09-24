class Mission < ActiveRecord::Base
  belongs_to :user
  has_many :pictures
  validates_uniqueness_of :name, message: "there is already a mission with that name."
end
