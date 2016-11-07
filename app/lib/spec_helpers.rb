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

end
