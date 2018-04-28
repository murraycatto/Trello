require 'rails_helper'

RSpec.feature 'Teams', type: :feature do
  before(:each) do
    user = create(:user)
    login_as(user, scope: :user)
    visit boards_path
  end

  context 'Create Team' do
    scenario 'should be successful' do
      page.evaluate_script("$('#create-team-form').show();")
      within('#TeamForm') do
        fill_in 'team[name]', with: 'Awesome Team'
        click_button 'Create'
      end
      expect(page).to have_content 'Awesome Team'
    end
    scenario 'should fail' do
      page.evaluate_script("$('#create-team-form').show();")
      within('#TeamForm') do
        fill_in 'team[name]', with: ''
        click_button 'Create'
      end
      expect(page).to_not have_content 'Awesome Team'
    end
  end
end
