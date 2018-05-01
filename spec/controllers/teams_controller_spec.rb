require 'rails_helper'

RSpec.describe TeamsController, type: :controller do
  before(:each) do
    user = create(:user)
    sign_in user
  end

  let(:valid_attributes) do
    {
      team: {
        name: 'Team Team',
        description: 'Team description'
      }
    }
  end

  let(:invalid_attributes) do
    {
      team: {
        name: '',
        description: 'Team description'
      }
    }
  end

  describe 'POST #create' do
    it 'should create a team' do
      expect do
        post :create, params: valid_attributes
      end.to change(Team, :count).by(1)
      expect(response).to redirect_to(boards_path)
    end

    it 'should fail to create team' do
      expect do
        post :create, params: invalid_attributes
      end.to change(Team, :count).by(0)
      expect(response.body.blank?).to be_truthy
    end
  end
end
