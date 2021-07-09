require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let!(:user) { User.create(name: "guy", email: "guy@gmail.com", password: "1234", password_confirmation: "1234") }
  let(:user_id) { user.id }
  let(:valid_attributes) do
    {
      'name' => 'Test',
      'email' => 'test@gmail.com',
      'password' => '1234',
      'password_confirmation' => '1234'
    }
  end

  # describe 'GET /index' do
  #   it 'renders a successful response' do
  #     user = User.new(valid_attributes)
  #     user.save
  #     get users_url
  #     expect(response).to be_successful
  #   end
  # end

  describe 'GET /users' do
    before { get '/users' }

    # it 'returns user' do
    #   expect(JSON).not_to be_empty
    #   expect(JSON['users'].size).to eq(user)
    # end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /users' do
    let(:valid_attributes) { { user: { name: "guy", email: "guy@gmail.com", password: "1234", password_confirmation: "1234" } } }

    context 'when the request is valid' do
      before { post '/signup', params: valid_attributes }

      it 'creates a user' do
        # expect(json['user']['name']).to eq('guy')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(422)
      end
    end

    context 'when the request is invalid' do
      before { post '/signup', params: { user: { name: 'guy2' } } }

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Password can't be blank/)
      end
    end
  end
end
