class Order < ApplicationRecord

  OPEN = 'open'

  belongs_to :user
  has_many :order_items

  validates :user, presence: true

  after_initialize :set_default_values

  extend FriendlyId
  friendly_id :order_number, use: :slugged

  def set_default_values
    # Only set if total_amount and/or order_number IS NOT set
    self.order_number ||= SecureRandom.base58(24)
  end

  def self.open
    where(status: OPEN)
  end

end
