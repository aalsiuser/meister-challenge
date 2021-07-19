FactoryBot.define do
  factory :comment do
    content { Faker::Lorem.sentence }
    date { Faker::Date.backward(days: 14) }
    post {create(:post) }
    user { create(:user) }
  end
end