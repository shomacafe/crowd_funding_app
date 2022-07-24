FactoryBot.define do
  factory :purchase do
    user_id { 1 }
    project_id { 1 }
    return_image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg'))}
    return_name { "リターン名" }
    return_price { 100 }
    return_introduction { "リターン説明" }
    association :user
    association :project
  end
end
