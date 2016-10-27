FactoryGirl.define do
  factory :address do
    street_address "MyString"
    city "MyString"
    state "MyString"
    zip_code "MyString"
    country "MyString"
    user nil
  end
end
