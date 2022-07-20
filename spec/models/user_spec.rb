require 'rails_helper'

RSpec.describe User, type: :model do
  it "名前、メールアドレス、パスワードがあれば有効であること" do
    user = build(:user)
    expect(user).to be_valid
  end

  it "名前がなければ無効な状態であること" do
    user = build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it "メールアドレスがなければ無効な状態であること" do
    user = build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "メールアドレスが重複していれば無効な状態であること" do
    user1 = create(:user, email: "tester@example.com")
    user2 = FactoryBot.build(:user, email: "tester@example.com")
    user2.valid?
    expect(user2.errors[:email]).to include("has already been taken")
  end

  it "パスワードがなければ無効な状態であること" do
    user = build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  it "プロフィールが200文字以内であれば有効であること" do
    user = build(:user, profile: "a" * 200)
    expect(user).to be_valid
  end

  it "プロフィールが200文字より多ければ無効であること" do
    user = build(:user, profile: "a" * 201)
    expect(user).to_not be_valid
  end
  
end
