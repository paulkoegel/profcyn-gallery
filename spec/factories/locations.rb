# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    country "MyString"
    city "MyString"
    region "MyString"
    kind "MyString"
  end
end
