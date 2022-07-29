require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "コメントがなければ無効な状態であること" do
    comment = build(:comment, message: nil)
    comment.valid?
    expect(comment.errors[:message]).to include("を入力してください")
  end
end
