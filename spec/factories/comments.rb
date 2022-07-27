FactoryBot.define do
  factory :comment do
    user_id { 1 }
    project_id { 1 }
    message { "コメント" }
    association :user
    association :project
  end
end
