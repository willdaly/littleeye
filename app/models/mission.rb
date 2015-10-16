class Mission < ActiveRecord::Base
  belongs_to :user
  has_many :pictures
  validates_presence_of :name
  validates_uniqueness_of :name, message: "there is already a mission with that name."
  validates_presence_of :user_id
end
