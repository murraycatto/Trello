require 'rails_helper'

RSpec.feature 'Lists', type: :feature do
  before(:each) do
    user = create :user
    team = create :team, user: user
    create :color
    @board = create :board, user: user, team: team
    login_as(user, scope: :user)
    visit board_path(@board)
  end
  context 'Create a list' do
    scenario 'should be successful' do
      page.evaluate_script("$('#create-list-form').show();")
      within('#ListForm') do
        fill_in 'list[name]', with: 'Awesome List'
        click_button 'Save'
      end
      expect(page).to have_content('Awesome List')
    end
    scenario 'should fail' do
      page.evaluate_script("$('#create-list-form').show();")
      within('#ListForm') do
        fill_in 'list[name]', with: ''
        click_button 'Save'
      end
      expect(page).to_not have_content('Awesome List')
    end
  end
end
