require 'rails_helper'

RSpec.describe Project, type: :model do

  it "プロジェクト情報があれば有効であること" do
    project = build(:project)
    expect(project).to be_valid
  end

  it "タイトルがなければ無効な状態であること" do
    project = build(:project, title: nil)
    project.valid?
    expect(project.errors[:title]).to include("を入力してください")
  end

  it "目標金額がなければ無効な状態であること" do
    project = build(:project, target_amount: nil)
    project.valid?
    expect(project.errors[:target_amount]).to include("を入力してください")
  end

  it "キャッチコピー1つ目がなければ無効な状態であること" do
    project = build(:project, catch_copy_1: nil)
    project.valid?
    expect(project.errors[:catch_copy_1]).to include("を入力してください")
  end

  it "キャッチコピー2つ目がなければ無効な状態であること" do
    project = build(:project, catch_copy_2: nil)
    project.valid?
    expect(project.errors[:catch_copy_2]).to include("を入力してください")
  end

  it "キャッチーコピー3つ目がなければ無効な状態であること" do
    project = build(:project, catch_copy_3: nil)
    project.valid?
    expect(project.errors[:catch_copy_3]).to include("を入力してください")
  end

  it "開始日がなければ無効な状態であること" do
    project = build(:project, start_date: nil)
    project.valid?
    expect(project.errors[:start_date]).to include("を入力してください")
  end

  it "終了日がなければ無効な状態であること" do
    project = build(:project, end_date: nil)
    project.valid?
    expect(project.errors[:end_date]).to include("を入力してください")
  end

  it "画像がなければ無効な状態であること" do
    project = build(:project, image: nil)
    project.valid?
    expect(project.errors[:image]).to include("を入力してください")
  end

  it "開始日が今日より前なら無効な状態であること" do
    project = build(:project, start_date: Date.today.advance(days: -1))
    expect(project).to_not be_valid
  end

  it "終了日が開始日より前なら無効な状態であること" do
    project = build(:project, start_date: "2022/07/18", end_date: "2022/07/17")
    expect(project).to_not be_valid
  end
end
