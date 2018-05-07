require 'rails_helper'

RSpec.describe CardCommentsController, type: :controller do
  before(:each) do
    user = create(:user)
    team = create :team, user: user
    create(:color)
    board = create :board, team: team, user: user
    list = create :list, board: board
    @card = create :card, list: list
    sign_in user
  end

  let(:valid_attributes) do
    {
      card_id: @card.id,
      card_comment: {
        comment: 'Test Comment'
      }
    }
  end

  let(:invalid_attributes) do
    {
      card_id: -1,
      card_comment: {
        comment: ''
      }
    }
  end

  describe 'POST #create' do
    it 'should pass' do
      expect do
        post :create, params: valid_attributes
      end.to change(CardComment, :count).by(1)
    end
    it 'should fail' do
      expect do
        post :create, params: invalid_attributes
      end.to change(CardComment, :count).by(0)
      expect(response).to redirect_to root_path
    end
  end
end
