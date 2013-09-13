require 'faker'
FactoryGirl.define do
  factory :menu do
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    start_at { Time.now }
    end_at { Time.now + 10_000 }
  end

  factory :menu_item do
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    price { 1 + rand(10) }
    menu
  end
end
