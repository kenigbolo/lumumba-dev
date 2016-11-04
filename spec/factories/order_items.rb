FactoryGirl.define do
  factory :order_item do
    quantity 1
    size "MyString"
    color "MyString"
    product
    order nil
  end
end