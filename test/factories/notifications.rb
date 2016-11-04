FactoryGirl.define do
  factory :notification do
    notice "MyString"
    user User
  end
end
