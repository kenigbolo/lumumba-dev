module SpecHelpers

  def self.any_image
    Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'blank.png'))
  end

  def any_image
    SpecHelpers.any_image
  end

  def controller_ok(status = 200)
    expect(response.status).to be status
    expect(response.body).to be_present
  end

  def sign_as user_options=nil

    let(:user){ FactoryGirl.create(:user, *user_options) }

    type = @metadata.fetch(:type)

    before do

      if type == :feature
        login_as(user, scope: :user)
      else
        sign_in(user, scope: :user)
      end

    end

  end

end
