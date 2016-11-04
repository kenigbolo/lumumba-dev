require "rails_helper"

RSpec.describe WelcomeMailer, type: :mailer do
  describe "signup_confirmation" do
    let(:user) { FactoryGirl.build :user }
    let(:mail) { WelcomeMailer.signup_confirmation(user) }

    it "renders the headers" do
      expect(mail.subject).to eq("Welcome to Lumumba")
      expect(mail.to).to eq(["welcome@lumumba.com"])
      expect(mail.from).to eq([user.email])
    end
  end
end
