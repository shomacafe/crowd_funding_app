require 'rails_helper'

RSpec.describe "Comments", type: :system do
  let!(:user_a) { create(:user, name: "ユーザーA", email: "a@example.com") }
  let!(:user_b) { create(:user, name: "ユーザーB", email: "b@example.com") }
  let!(:user_c) { create(:user, name: "ユーザーC") }
  let!(:project) { create(:project, title: "プロジェクトA", user: user_a, comments: [comments]) }
  let!(:comments) { create(:comment, message: "ユーザーCのコメントです。", user: user_c) }
  
  describe "コメント機能機能" do
    context "ユーザーAがログインしているとき" do
      let(:login_user) { user_a }

      before do
        visit new_user_session_path
        fill_in "user_email", with: login_user.email
        fill_in "user_password", with: login_user.password
        click_button "ログイン"
        visit project_path(project.id)
        fill_in "comment_message", with: "ユーザーAの新しいコメントです。"
        click_button "投稿"
      end

      it "コメントフォームに入力したら同ページに投稿されること" do
        expect(page).to have_content "ユーザーAの新しいコメントです。"
      end

      it "投稿したコメントを削除できること" do
        click_link "削除" 
        page.accept_alert
        expect(page).not_to have_content "ユーザーAの新しいコメントです。"
      end
    end
    
    context "ユーザーBがログインしているとき" do
      let(:login_user) { user_b }

      before do
        visit new_user_session_path
        fill_in "user_email", with: login_user.email
        fill_in "user_password", with: login_user.password
        click_button "ログイン"
        visit project_path(project.id)
      end

      it "ユーザーC(自分以外)のコメントは削除できないこと" do
        expect(page).to have_content "ユーザーCのコメントです。"
        expect(page).to have_no_selector ".commentContainer", text: "削除"
      end
    end

    context "ログインしていないとき" do
      it "コメントできないこと" do
        visit project_path(project.id)
        expect(page).to have_content "コメントを投稿するにはログインが必要です。"
      end
    end
  end
end
