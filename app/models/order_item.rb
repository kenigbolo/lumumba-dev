class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :color, :quantity, :size, presence: true
  validates :order, presence: true
  validates :product, presence: true

  def get_product
    Product.find(product_id)
  end
end
