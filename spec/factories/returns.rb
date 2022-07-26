FactoryBot.define do
  factory :return do
    return_image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg'))}
    return_price { 12345 }
    return_name { "returnのリターン名" }
    return_introduction { "リターン説明" }
    user_id { 1 }
    project_id { 1 }
    association :project
  end
end
