FactoryGirl.define do
  factory :order_item do
    quantity 1
    size { SecureRandom.hex }
    color { SecureRandom.hex }
    product
    order 
  end
end
