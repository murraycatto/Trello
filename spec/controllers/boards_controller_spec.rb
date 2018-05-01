require 'rails_helper'

RSpec.describe BoardsController, type: :controller do
  before(:each) do
    user = create(:user)
    @team = create :team, user: user
    create(:color)
    sign_in user
  end

  let(:valid_attributes) do
    {
      board: {
        name: 'Test Board',
        team: @team.id
      }
    }
  end

  let(:invalid_attributes) do
    {
      board: {
        name: '',
        team: ''
      }
    }
  end

  describe 'POST #create' do
    it 'should pass' do
      expect do
        post :create, params: valid_attributes
      end.to change(Board, :count).by(1)
      # expect(response).to redirect_to(boards_path(Board.last))
    end
    it 'should fail' do
      expect do
        post :create, params: invalid_attributes
      end.to change(Board, :count).by(0)
      expect(response.body.blank?).to be_truthy
    end
  end
end
