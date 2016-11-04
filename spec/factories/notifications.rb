FactoryGirl.define do
  factory :notification do
    notice { SecureRandom.hex }
    user
  end
end
