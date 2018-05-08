require 'rails_helper'

RSpec.describe ChecklistItemsController, type: :controller do
  before(:each) do
    user = create(:user)
    sign_in user
    team = create :team, user: user
    board = create :board, team: team, user: user
    list = create :list, board: board
    card = create :card, list: list
    @checklist = create :checklist, card: card
    @checklist_item = create :checklist_item, checklist: @checklist
  end

  let(:valid_attributes) do
    {
      checklist_id: @checklist.id,
      checklist_item: {
        name: 'Test Checklist Item'
      }
    }
  end

  let(:invalid_checklist_id_attributes) do
    {
      checklist_id: -1,
      checklist_item: {
        name: 'Test Checklist Item'
      }
    }
  end

  let(:invalid_name_attributes) do
    {
      checklist_id: @checklist.id,
      checklist_item: {
        name: ''
      }
    }
  end

  describe 'POST #create' do
    it 'should pass' do
      expect do
        post :create, params: valid_attributes
      end.to change(ChecklistItem, :count).by(1)
    end

    it 'should fail' do
      expect do
        post :create, params: invalid_checklist_id_attributes
      end.to change(ChecklistItem, :count).by(0)
      expect(response).to redirect_to(root_path)
    end

    it 'should fail' do
      expect do
        post :create, params: invalid_name_attributes
      end.to change(ChecklistItem, :count).by(0)
      expect(response.body.blank?).to be_truthy
    end
  end

  describe 'GET #toggel_status' do
    it 'should pass' do
      get :toggel_status, params: { id: @checklist_item.id }
      @checklist_item.reload
      expect(@checklist_item.complete?).to be_truthy
    end
    it 'should fail' do
      get :toggel_status, params: { id: -1 }
      expect(response).to redirect_to(root_path)
      @checklist_item.reload
      expect(@checklist_item.complete?).to be_falsey
    end
  end
end
