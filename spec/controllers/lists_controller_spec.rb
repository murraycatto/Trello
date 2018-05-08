require 'rails_helper'

RSpec.describe ListsController, type: :controller do
  before(:each) do
    user = create(:user)
    sign_in user
    team = create :team, user: user
    @board = create :board, team: team, user: user
  end

  let(:valid_attributes) do
    {
      list: {
        name: 'Test List',
        board_id: @board.id
      }
    }
  end

  let(:invalid_attributes) do
    {
      list: {
        name: '',
        board_id: ''
      }
    }
  end

  describe 'POST #create' do
    it 'should pass' do
      expect do
        post :create, params: valid_attributes
      end.to change(List, :count).by(1)
    end
    it 'should fail' do
      expect do
        post :create, params: invalid_attributes
      end.to change(List, :count).by(0)
      expect(response.body.blank?).to be_truthy
    end
  end
end
