FactoryGirl.define do
  factory :user do
    email    { Faker::Internet.email }
    password { Faker::Internet.password(10, 20) }
  end

  factory :user_with_profile, parent: :user do
    after(:create) { |user| create(:profile, user: user) }
  end
end
