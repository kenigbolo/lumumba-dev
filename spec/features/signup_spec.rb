require 'rails_helper'
require 'spec_helper'

describe 'Signing up' do

  let(:reference_user){ FactoryGirl.build :user }

  it 'works' do

    visit new_user_registration_path

    fill_in 'user_email', with: reference_user.email
    fill_in 'user_password', with: reference_user.password
    fill_in 'user_password_confirmation', with: reference_user.password
    fill_in 'user_first_name', with: reference_user.first_name
    fill_in 'user_last_name', with: reference_user.last_name
    find("#user_gender option[value='#{reference_user.gender}']").select_option

    expect {
      click_button 'Sign up'
    }.to change {
      User.count
    }.by(1)

    expect(page).to have_content 'A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.'

    expect(User.last.email).to eq reference_user.email
    expect(User.last.first_name).to eq reference_user.first_name
    expect(User.last.last_name).to eq reference_user.last_name
    expect(User.last.gender).to eq reference_user.gender

  end
end
