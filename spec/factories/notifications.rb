FactoryGirl.define do
  factory :notification do
    content { Faker::Lorem.sentence }
  end
end
