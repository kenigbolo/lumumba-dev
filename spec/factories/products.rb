FactoryGirl.define do
  factory :product do
    name { SecureRandom.hex }
    main_image { SpecHelpers.any_image }
    first_thumbnail { SpecHelpers.any_image }
    second_thumbnail { SpecHelpers.any_image }
    third_thumbnail { SpecHelpers.any_image }
    price '9.99'
    description { SecureRandom.hex }
    designer { SecureRandom.hex }
    preview false
  end
end
