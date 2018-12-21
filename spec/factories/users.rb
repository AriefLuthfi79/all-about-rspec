FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "testing" }
    password_confirmation { "testing" }

    factory :admin do
      after(:create) { |user| user.add_role :admin }
    end

    factory :power_user do
      after(:create) { |user| user.add_role :power_user }
    end
  end
end
