require 'rails_helper'

RSpec.describe Task, type: :model do
  # Association test
  # ensure an item record belongs to a single todo record
  # it { should belong_to(:project) }
  # Validation test
  # ensure column name is present before saving
  it 'is not valid without a title' do
    titre = Task.new(title: nil)
    expect(titre).to_not be_valid
  end
end
