class Picture < ActiveRecord::Base
  belongs_to :mission
  validates_presence_of :mission_id
  validates_presence_of :url
  validates_inclusion_of :answer, in: [true, false]
end
