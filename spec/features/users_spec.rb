require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  context 'Sign Up' do
    before(:each) do
      visit new_user_registration_path
      within('form') do
        fill_in 'user_name', with: 'Test '
        fill_in 'user_email', with: 'test@email.com'
        fill_in 'user_password', with: 'Password123'
        fill_in 'user_password_confirmation', with: 'Password123'
      end
    end

    scenario 'should be successful' do
      click_button 'Create New Account'
      expect(page).to have_content 'Hey, you’re logged in!'
    end

    scenario 'should fail' do
      within('form') do
        fill_in 'user_password_confirmation', with: 'Password1234'
      end
      click_button 'Create New Account'
      expect(page).to have_content "Password confirmation doesn't match Password"
    end
  end

  context 'Login' do
    before(:each) do
      visit new_user_session_path
      create(:user)
      within('form') do
        fill_in 'user_email', with: 'test@example.com'
        fill_in 'user_password', with: 'Password123'
      end
    end

    scenario 'should be successful' do
      click_button 'Log in'
      expect(page).to have_content 'Hey, you’re logged in!'
    end

    scenario 'should fail' do
      within('form') do
        fill_in 'user_password', with: 'Password1234'
      end
      click_button 'Log in'
      expect(page).to have_content 'Log in to Trello'
    end
  end
end
