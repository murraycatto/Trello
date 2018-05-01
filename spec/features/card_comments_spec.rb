require 'rails_helper'

RSpec.feature 'CardComments', type: :feature do
  context 'Create Card Comment' do
    before(:each) do
      user = create :user
      login_as(user, scope: :user)
      team = create :team, user: user
      create :color
      board = create :board, user: user, team: team
      list = create :list, board: board
      @card = create :card, list: list
      visit board_path(board)
    end
    # scenario 'should pass' do
    #   page.evaluate_script("dynamicAjaxGet('#{card_path(@card)}','ModalHolder','showModals();')")
    # end
    # scenario 'should fail' do
    # end
  end
end
