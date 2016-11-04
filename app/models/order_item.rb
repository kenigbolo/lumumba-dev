class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :color, :quantity, :size, presence: true

  def get_product
    Product.find(product_id)
  end
end
