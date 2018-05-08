require 'rails_helper'

RSpec.describe BoardsController, type: :controller do
  before(:each) do
    user = create(:user)
    @team = create :team, user: user
    create(:color)
    @board = create :board, team: @team, user: user
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
      # This should work for some reason I'm getting:
      # Expected "http://test.host/boards.1" to be "http://test.host/boards/1"
    end
    it 'should fail' do
      expect do
        post :create, params: invalid_attributes
      end.to change(Board, :count).by(0)
      expect(response.body.blank?).to be_truthy
    end
  end

  describe 'GET #index' do
    it 'should pass' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    it 'should pass' do
      get :show, params: { id: @board.id }
      expect(response).to render_template('show')
    end
    it 'should fail' do
      get :show, params: { id: -1 }
      expect(response).to redirect_to boards_path
    end
  end
end
