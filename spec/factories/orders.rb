FactoryGirl.define do
  factory :order do
    order_number "MyString"
    payment_method "MyString"
    total_amount "9.99"
    status "MyString"
    address nil
    user nil
  end
end
