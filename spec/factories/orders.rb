FactoryGirl.define do
  factory :order do
    order_number { SecureRandom.hex }
    payment_method { SecureRandom.hex }
    total_amount { SecureRandom.hex }
    status { SecureRandom.hex }
    address
    user
  end
end