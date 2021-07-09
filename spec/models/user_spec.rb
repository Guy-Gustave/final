require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is not valid without email' do
    usr = User.new(email: nil)
    expect(usr).to_not be_valid
  end

  it 'is not valid without name' do
    usr = User.new(name: nil)
    expect(usr).to_not be_valid
  end

  it 'is not valid without password' do
    usr = User.new(password: nil)
    expect(usr).to_not be_valid
  end

  it { should validate_length_of(:password).is_at_least(4) }

  it { should validate_length_of(:name).is_at_least(4) }
end

