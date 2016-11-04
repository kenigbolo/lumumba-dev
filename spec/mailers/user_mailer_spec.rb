require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "contact_us" do
    let(:message) { FactoryGirl.build :message }
    let(:mail) { UserMailer.contact_us(message) }

    it "renders the headers" do
      expect(mail.subject).to eq("Message from Contact Us form")
      expect(mail.to).to eq(["tribe@lumumba.com"])
      expect(mail.from).to eq([message.email])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match(message.message)
    end
  end
  describe "first_vote_notification" do
    let(:design) {FactoryGirl.build :design}
    let(:mail) {UserMailer.first_vote_notification(design)}

    it "renders the headers" do
      expect(mail.subject).to eq("You just got your first vote!")
      expect(mail.to).to eq(["notifications@lumumba.com"])
      expect(mail.from).to eq([design.user.email])
    end
  end

end
