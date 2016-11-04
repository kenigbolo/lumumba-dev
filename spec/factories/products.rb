FactoryGirl.define do
  factory :product do
    name { SecureRandom.hex }
    main_image { any_image }
    first_thumbnail { any_image }
    second_thumbnail { any_image }
    third_thumbnail { any_image }
    price '9.99'
    description { SecureRandom.hex }
    designer { SecureRandom.hex }
    preview false
  end
end
