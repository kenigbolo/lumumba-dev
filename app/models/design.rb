class Design < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader

  def init
  	self.for_sale ||= false
  	self.for_competition ||= false
  end
end
