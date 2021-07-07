require 'rails_helper'

RSpec.describe 'Tasks', type: :request do
  let(:valid_attributes) do
    {
      'title' => 'Test',
      'done' => true,
      'project_id' => 1
    }
  end

  # describe "GET /index" do
  #   it 'renders a successful response' do
  #     task = Task.new(valid_attributes)
  #     task.save
  #     get project_tasks_url
  #     expect(response).to be_successful
  #   end
  # end 
end
