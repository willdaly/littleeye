require 'rails_helper'

RSpec.describe Picture do
  it { should validate_presence_of :mission_id }
  it { should validate_presence_of :url }
  it { should validate_inclusion_of(:answer).in_array([true, false]) }
end
