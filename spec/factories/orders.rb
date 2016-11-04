FactoryGirl.define do
  factory :order do
    order_number { SecureRandom.hex }
    payment_method "BrainTree"
    total_amount 1.50
    status "Submitted for settlement"
    address nil
    user nil
  end
end
