FactoryBot.define do
  factory :comment_reaction do
    user { create(:user) }
    comment { create(:comment) }
    reaction_type { 0 }
  end
end