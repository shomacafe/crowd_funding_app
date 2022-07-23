FactoryBot.define do
  factory :return do
    return_image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg'))}
    return_price { 1 }
    return_name { "リターン名" }
    return_introduction { "リターン説明" }
    user_id { 1 }
    project_id { 1 }
  end
end
