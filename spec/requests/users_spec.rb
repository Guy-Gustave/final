require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:valid_attributes) do
    {
      'name' => 'Test',
      'email' => 'test@gmail.com',
      'password' => '1234',
      'password_confirmation' => '1234'
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      user = User.new(valid_attributes)
      user.save
      get users_url
      expect(response).to be_successful
    end
  end
end
