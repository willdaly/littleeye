require 'rails_helper'

RSpec.describe User, :type => :model do
  it { should validate_numericality_of :score }
end
