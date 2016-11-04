FactoryGirl.define do
  factory :address do
    street_address { SecureRandom.hex }
    city { SecureRandom.hex }
    state { SecureRandom.hex }
    zip_code { SecureRandom.hex }
    country { SecureRandom.hex }
    user
  end
end
