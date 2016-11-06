require 'rails_helper'
require 'spec_helper'

describe 'Logging in' do

  let(:password){ SecureRandom.hex }

  def fill_form
    visit root_path
    first("a[href='#{new_user_session_path}']").click
    find('#user_email').set user.email
    find('#user_password').set user.password
  end

  def submit_form
    find('#new_user input[type=submit]').click
    sleep 3
  end

  context "For a confirmed_user" do

    let!(:user){ FactoryGirl.create :user, password: password, password_confirmation: password }

    it "works" do

      fill_form

      expect {
        submit_form
      }.to change {
        current_path
      }.from(new_user_session_path).to(user_path(user.slug))

    end

  end

  context "For a non-confirmed user" do

    let!(:user){ FactoryGirl.create :user, password: password, password_confirmation: password, confirmed_at: nil }

    it "works" do

      fill_form

      expect {
        submit_form
      }.to_not change {
        current_path
      }

    end

  end

end
