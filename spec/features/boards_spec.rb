require 'rails_helper'

RSpec.feature 'Boards', type: :feature do
  before(:each) do
    user = create :user
    create :color
    @team = create :team, user: user
    login_as(user, scope: :user)
    visit boards_path
  end

  context 'Create board' do
    scenario 'should be successful' do
      page.evaluate_script("$('#create-board-form-#{@team.id}').show();")
      within("#BoardForm#{@team.id}") do
        fill_in 'board[name]', with: 'Awesome Board'
        click_button 'Create'
      end
      expect(page).to have_content 'Awesome Board'
    end

    scenario 'should fail' do
      page.evaluate_script("$('#create-board-form-#{@team.id}').show();")
      within("#BoardForm#{@team.id}") do
        fill_in 'board[name]', with: ''
        click_button 'Create'
      end
      expect(page).to_not have_content 'Awesome board'
    end
  end
end
