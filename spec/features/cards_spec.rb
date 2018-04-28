require 'rails_helper'

RSpec.feature 'Cards', type: :feature do
  before(:each) do
    user = create :user
    team = create :team, user: user
    create :color
    board = create :board, user: user, team: team
    @list = create :list, board: board
    @list2 = create :list, board: board
    @card = create :card, list: @list
    login_as(user, scope: :user)
    visit board_path(board)
  end
  context 'Create Card' do
    scenario 'should pass' do
      page.evaluate_script("$('#new-card-holder-#{@list.id}').hide();")
      page.evaluate_script("$('#new-card-form-#{@list.id}').show();")
      within("#CardForm#{@list.id}") do
        fill_in 'card[name]', with: 'Awesome Card'
        click_button 'Add'
      end
      expect(page).to have_content('Awesome Card')
    end
    scenario 'should fail' do
      page.evaluate_script("$('#new-card-holder-#{@list.id}').hide();")
      page.evaluate_script("$('#new-card-form-#{@list.id}').show();")
      within("#CardForm#{@list.id}") do
        fill_in 'card[name]', with: ''
        click_button 'Add'
      end
      expect(page).to_not have_content('Awesome Card')
    end
  end

  context 'Update Cards List' do
    scenario 'should pass' do
      # page.evaluate_script("moveCardToList('#List#{@list2.id}','#Card#{@card.id}');")
      # expect(@card.list.id).to eq(@list2.id)
    end
  end
end
