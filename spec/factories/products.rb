FactoryGirl.define do
  factory :product do
    name "MyString"
    main_image { any_image }
    first_thumbnail { any_image }
    second_thumbnail { any_image }
    third_thumbnail { any_image }
    price "9.99"
    description "MyString"
    designer "MyString"
    preview false
  end
end
