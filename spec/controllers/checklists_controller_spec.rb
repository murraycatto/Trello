require 'rails_helper'

RSpec.describe ChecklistsController, type: :controller do
  before(:each) do
    user = create(:user)
    sign_in user
    team = create :team, user: user
    board = create :board, team: team, user: user
    list = create :list, board: board
    @card = create :card, list: list
  end
  let(:valid_attributes) do
    {
      card_id: @card.id,
      checklist: {
        title: 'Test Checklist'
      }
    }
  end

  let(:invalid_card_id_attributes) do
    {
      card_id: -1,
      checklist: {
        title: 'Test Checklist'
      }
    }
  end
  let(:invalid_title_attributes) do
    {
      card_id:  @card.id,
      checklist: {
        title: ''
      }
    }
  end

  describe 'POST #create' do
    it 'should pass' do
      expect do
        post :create, params: valid_attributes
      end.to change(Checklist, :count).by(1)
    end
    it 'should fail' do
      expect do
        post :create, params: invalid_card_id_attributes
      end.to change(Checklist, :count).by(0)
      expect(response).to redirect_to(root_path)
    end
    it 'should fail' do
      expect do
        post :create, params: invalid_title_attributes
      end.to change(Checklist, :count).by(0)
      expect(response.body.blank?).to be_truthy
    end
  end
end
