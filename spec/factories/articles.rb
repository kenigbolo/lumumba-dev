FactoryGirl.define do
  factory :article do
    title { SecureRandom.hex(20) }
    image{ any_image }
    description { SecureRandom.hex(500) }
    author { SecureRandom.hex() }
  end
end
