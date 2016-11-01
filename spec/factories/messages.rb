FactoryGirl.define do
  factory :message do
    name { SecureRandom.hex }
    email { "#{SecureRandom.hex}@#{SecureRandom.hex}.com" }
    message { SecureRandom.hex }
  end
end
