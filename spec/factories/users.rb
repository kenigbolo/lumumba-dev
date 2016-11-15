FactoryGirl.define do
  factory :user do

    first_name { SecureRandom.hex }
    last_name { SecureRandom.hex }
    email { "#{SecureRandom.hex}@#{SecureRandom.hex}.com" }
    password { SecureRandom.hex }
    gender { User::GENDERS.sample }
    confirmed_at { Time.now + 5.seconds }

    trait :admin do
      admin true
    end

  end
end
