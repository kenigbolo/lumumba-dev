class ImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick
  include Cloudinary::CarrierWave

  process convert: 'png'
  process tags: ['post_picture']

  version :standard do
    process resize_to_fill: [100, 150, :north]
  end

  version :thumbnail do
    eager
    resize_to_fit(50, 50)
  end
end
