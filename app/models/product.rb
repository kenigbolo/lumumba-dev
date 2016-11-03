class Product < ApplicationRecord
	mount_uploader :main_image, AvatarUploader
	mount_uploader :first_thumbnail, AvatarUploader
	mount_uploader :second_thumbnail, AvatarUploader
	mount_uploader :third_thumbnail, AvatarUploader

	has_many :order_items
	validates :main_image, :first_thumbnail, :second_thumbnail, :third_thumbnail, :price, presence: true

	extend FriendlyId
  friendly_id :name, use: :slugged

end
