require 'rails_helper'

# Test suite for the Todo model
RSpec.describe Project, type: :model do
  it "is not valid without a title" do
    proj = Project.new(title: nil)
    expect(proj).to_not be_valid
  end

  # it { should have_many(:tasks) }

  it "is not valid without a description" do
    proj = Project.new(description: nil)
    expect(proj).to_not be_valid
  end
end
