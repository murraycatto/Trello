require 'rails_helper'

RSpec.describe CardsController, type: :controller do
  before(:each) do
    user = create(:user)
    sign_in user
    team = create :team, user: user
    board = create :board, team: team, user: user
    @list = create :list, board: board
    @list2 = create :list, board: board
    @card = create :card, list: @list
  end

  let(:valid_attributes) do
    {
      card: {
        name: 'Test Card',
        list_id: @list.id
      }
    }
  end

  let(:invalid_attributes) do
    {
      card: {
        name: '',
        list_id: ''
      }
    }
  end

  describe 'GET #show' do
    it 'should pass' do
      get :show, params: { id: @card.id }
      expect(response).to render_template('modal')
    end
    it 'should fail' do
      get :show, params: { id: -1 }
      expect(response).to redirect_to(root_path)
    end
  end

  describe 'PUT #update_list' do
    it 'should pass' do
      put :update_list, params: { id: @card.id, list_id: @list2.id }
      @card.reload
      expect(@card.list).to eq(@list2)
    end
    it 'should fail' do
      put :update_list, params: { id: -1 }
      expect(response).to redirect_to(root_path)
    end
    it 'should fail' do
      put :update_list, params: { id: @card.id, list_id: -1 }
      expect(response.body.blank?).to be_truthy
    end
  end

  describe 'POST #update' do
    it 'should pass' do
      post :update, params: { id: @card.id, name: 'New Name' }
      @card.reload
      expect(@card.name).to eq('New Name')
    end
    it 'should fail' do
      post :update, params: { id: -1 }
      expect(response).to redirect_to(root_path)
    end
    it 'should fail' do
      post :update, params: { id: @card.id, name: '' }
      expect(response.body.blank?).to be_truthy
    end
  end

  describe 'POST #create' do
    it 'should pass' do
      expect do
        post :create, params: valid_attributes
      end.to change(Card, :count).by(1)
    end
    it 'should fail' do
      expect do
        post :create, params: invalid_attributes
      end.to change(Card, :count).by(0)
      expect(response.body.blank?).to be_truthy
    end
  end
end
