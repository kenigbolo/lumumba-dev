class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_one :address

  after_initialize :set_default_values

  extend FriendlyId
  friendly_id :order_number, use: :slugged

  def set_default_values
    # Only set if total_amount and/or order_number IS NOT set
    self.order_number ||= SecureRandom.base58(24)
  end
end
