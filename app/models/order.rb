class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items

  after_initialize :set_default_values
  
  def set_default_values
    # Only set if total_amount and/or order_number IS NOT set
    self.order_number ||= SecureRandom.base58(24)
  end
end
