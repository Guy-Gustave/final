require 'rails_helper'

RSpec.describe "Projects", type: :request do

  let!(:projects) { create_list(:project, 10) }
  let(:project_id) { project.first.id }

  describe "GET /index" do
    pending "add some examples (or delete) #{__FILE__}"
  end

  # Test suite for GET /projects
  describe 'GET /projects' do
    # make HTTP get request before each example
    before { get '/projects' }

    it 'returns projects' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /projects/:id' do
    before { get "/projects/#{project_id}" }

    context 'when the record exists' do
      it 'returns the project' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(project_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:project_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find project/)
      end
    end
  end

  # Test suite for PUT /projects/:id
  describe 'PUT /projects/:id' do
    let(:valid_attributes) { { title: 'Shopping' } }

    context 'when the record exists' do
      before { put "/projects/#{project_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

end
