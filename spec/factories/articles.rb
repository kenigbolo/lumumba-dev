FactoryGirl.define do
  factory :article do
    title { SecureRandom.hex(20) }
    image { SpecHelpers.any_image }
    description { SecureRandom.hex(500) }
    author { SecureRandom.hex }
    user
  end
end
