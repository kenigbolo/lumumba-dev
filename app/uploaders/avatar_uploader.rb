class AvatarUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick
  unless Rails.env.test?
    include Cloudinary::CarrierWave
    process convert: 'png'
    process tags: ['post_picture']
  end

  version :standard do
    unless Rails.env.test?
      process resize_to_fill: [100, 150, :north]
    end
  end

  version :thumbnail do
    unless Rails.env.test?
      eager
      resize_to_fit(50, 50)
    end
  end
end
