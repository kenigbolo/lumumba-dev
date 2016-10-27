class Product < ApplicationRecord
	mount_uploader :main_image, AvatarUploader
	mount_uploader :first_thumbnail, AvatarUploader
	mount_uploader :second_thumbnail, AvatarUploader
	mount_uploader :third_thumbnail, AvatarUploader

	validates :main_image, :first_thumbnail, :second_thumbnail, :third_thumbnail, :price, presence: true
	validates :description, presence: true, length: { minimum: 20 }
	validates :name, presence: true, length: { minimum: 10 }
end
