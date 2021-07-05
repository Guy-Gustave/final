require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is not valid without email' do
    usr = User.new(email: nil)
    expect(usr).to_not be_valid
  end
end
