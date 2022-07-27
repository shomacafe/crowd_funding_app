FactoryBot.define do
  factory :purchase do
    user_id { 1 }
    project_id { 1 }
    return_name { "purchaseのリターン名" }
    return_price { 100 }
    return_introduction { "purchaseのリターン説明" }
    association :user
    association :project
  end
end
