class Picture < ActiveRecord::Base
  # validates_presence_of :answer
  belongs_to :mission
end
