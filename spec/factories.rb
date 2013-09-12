require 'faker'
FactoryGirl.define do
  factory :menu do
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    start_at { Time.now }
  end
end
