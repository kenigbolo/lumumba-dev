require 'rails_helper'
require 'spec_helper'

RSpec.feature 'SignUps', type: :feature do
  ### Test for creating an account
  describe 'Spec for Sign Up' do
    it 'should create new user account' do
      visit new_user_registration_path
      email = 'abcd@example.com'
      first_name = 'Kenigbolo'
      last_name = 'Meya Stephen'

      fill_in 'user_email', with: email
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      fill_in 'user_first_name', with: :first_name
      fill_in 'user_last_name', with: :last_name
      click_button 'Sign up'
      expect(page).to have_content 'A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.'
    end
  end
end
