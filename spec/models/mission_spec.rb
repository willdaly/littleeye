require 'rails_helper'

RSpec.describe Mission do
  it { should validate_presence_of :name }
  it { should validate_presence_of :user_id }
end
