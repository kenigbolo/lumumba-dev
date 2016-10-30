class OrderItem < ApplicationRecord
  belongs_to :order
  has_one :product

  validates :color, :quantity, :size, presence: true
end
