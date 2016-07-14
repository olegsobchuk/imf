FactoryGirl.define do
  factory :user do
    email    { Faker::Internet.email }
    password { Faker::Internet.password(10, 20) }
    after(:build) { |user| user.password_confirmation = user.password }
  end

  factory :user_with_profile, parent: :user do
    after(:create) { |user| create(:profile, user: user) }
  end
end
