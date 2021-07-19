FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    summary { Faker::Lorem.sentence }
    content { Faker::Lorem.sentence }
    author {create(:user)}
  end
end