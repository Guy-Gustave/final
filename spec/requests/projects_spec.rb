require 'rails_helper'

RSpec.describe 'Projects', type: :request do
  let(:valid_attributes) do
    {
      'title' => 'Test',
      'description' => 'project',
      'rates' => 4
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      project = Project.new(valid_attributes)
      project.save
      get projects_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      project = Project.new(valid_attributes)
      # project.user = current_user
      project.save
      get project_url(project)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    it 'creates a new Project' do
      expect do
        project = Project.new(valid_attributes)
        # project.user = current_user
        project.save
        post projects_url, params: { project: valid_attributes }
      end.to change(Project, :count).by(1)
    end
  end
end
