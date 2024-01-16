FactoryBot.define do
  factory :group do
    name { Faker::Lorem.name }
  end

  factory :user do
    # name { Faker::Lorem.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }

    group { FactoryBot.create(:group) }
  end

  factory :item do
    name { Faker::Commerce.product_name }
    quantity { Faker::Number.between from: 1, to: 15 }
    is_checked { Faker::Boolean.boolean }
    author { FactoryBot.create(:user) }
  end
end
