FactoryBot.define do
  factory :project do
    sequence(:title) { |n| "プロジェクト#{n}" }
    target_amount { 100 }
    start_date { "2032-07-20" }
    end_date { "2032-8-20" }
    catch_copy_1 { "catchcopy1" }
    catch_copy_2 { "catchcopy2" }
    catch_copy_3 { "catchcopy3" }
    content { "プロジェクト概要" }
    user_id { 1 }
    purchase_id { 1 }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg'))}
    association :user

    trait :with_nested_instances do
      after( :create ) do |project|
        create :return, id: project.id
      end
    end  
  end
end
