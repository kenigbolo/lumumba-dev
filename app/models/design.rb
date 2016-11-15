class Design < ApplicationRecord

  belongs_to :user
  acts_as_votable

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

  validates :user, presence: true

  # image validations:

  validates :image, presence: true

  validates :first_garment_design, presence: true
  validates :second_garment_design, presence: true
  validates :third_garment_design, presence: true

  validates :first_garment_print_design, presence: true
  validates :second_garment_print_design, presence: true
  validates :third_garment_print_design, presence: true

  validates :first_garment_model_design, presence: true
  validates :second_garment_model_design, presence: true
  validates :third_garment_model_design, presence: true

  validates :first_garment_technical_design, presence: true
  validates :second_garment_technical_design, presence: true
  validates :third_garment_technical_design, presence: true

  # description validations:

  validates :image_desc, presence: true
  validates :first_garment_desc, presence: true
  validates :second_garment_desc, presence: true
  validates :third_garment_desc, presence: true

  before_validation :for_competition_default_value
  before_validation :competition_default_value

  def self.for_competition
    where(for_competition: true)
  end

  def in_competition?
    competition.present?
  end

  # converts nils into trues
  def for_competition_default_value
    unless [false, 'false'].include?(self.for_competition)
      self.for_competition = true
    end
  end

  # converts nils into trues
  def competition_default_value
    unless [false, 'false'].include?(self.competition)
      self.competition = true
    end
  end

end
