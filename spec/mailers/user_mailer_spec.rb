require "rails_helper"

RSpec.describe UserMailerMailer, type: :mailer do
  describe "contact_us" do
    let(:mail) { UserMailerMailer.contact_us }

    it "renders the headers" do
      expect(mail.subject).to eq("Contact us")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
