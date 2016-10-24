class Design < ApplicationRecord
  belongs_to :user
  
  mount_uploader :image, ImageUploader
  mount_uploader :first_garment_design, ImageUploader
  mount_uploader :second_garment_design, ImageUploader
  mount_uploader :third_garment_design, ImageUploader
  mount_uploader :first_garment_model_design, ImageUploader
  mount_uploader :second_garment_model_design, ImageUploader
  mount_uploader :third_garment_model_design, ImageUploader
  mount_uploader :first_garment_print_design, ImageUploader
  mount_uploader :second_garment_print_design, ImageUploader
  mount_uploader :third_garment_print_design, ImageUploader
  mount_uploader :first_garment_technical_design, ImageUploader
  mount_uploader :second_garment_technical_design, ImageUploader
  mount_uploader :third_garment_technical_design, ImageUploader

  validates :image, presence: true
  validates :image_desc, presence: true
  validates :first_garment_desc, presence: true
  validates :second_garment_desc, presence: true
  validates :third_garment_desc, presence: true
  validates :first_garment_print_design, presence: true
  validates :second_garment_print_design, presence: true
  validates :third_garment_print_design, presence: true
  validates :first_garment_design, presence: true
  validates :second_garment_design, presence: true
  validates :third_garment_design, presence: true
end