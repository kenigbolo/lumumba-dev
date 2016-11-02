FactoryGirl.define do
  factory :user do
    email { "#{SecureRandom.hex}@#{SecureRandom.hex}.com" }
    password { SecureRandom.hex }
  end
end
