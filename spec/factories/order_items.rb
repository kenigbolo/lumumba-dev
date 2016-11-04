FactoryGirl.define do
  factory :order_item do
    quantity 1
    size "M"
    color "blue"
    product
    order 
  end
end