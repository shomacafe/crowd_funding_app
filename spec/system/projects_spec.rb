require 'rails_helper'

RSpec.describe "Projects", type: :system do

  let!(:user_a) { create(:user, name: "ユーザーA", email: "a@example.com") }
  let(:user_b) { create(:user, name: "ユーザーB", email: "b@example.com") }
  let!(:project_a) { create(:project, title:"プロジェクトA", user: user_a) }

  describe "作成済みプロジェクト一覧表示機能" do
    before do
      visit new_user_session_path
      fill_in "user_email", with: login_user.email
      fill_in "user_password", with: login_user.password
      click_button "ログイン"
    end

    context "ユーザーAがログインしてるとき" do
      let(:login_user) { user_a }

      before do
        visit posts_projects_path
      end

      it "ユーザーAが作成したプロジェクトが表示されること" do
        expect(page).to have_content "プロジェクトA"
      end
    end

    context "ユーザーBがログインしてるとき" do
      let(:login_user) { user_b }

      it "ユーザーAが作成したプロジェクトが表示されないこと" do
        expect(page).not_to have_content "プロジェクトA"
      end
    end
  end

  describe "プロジェクト新規作成機能" do
    before do
      visit new_user_session_path
      fill_in "user_email", with: login_user.email
      fill_in "user_password", with: login_user.password
      click_button "ログイン"

      visit new_project_path
      fill_in "project_title", with: project_title
      fill_in "project_catch_copy_1", with: "catch_copy_1"
      fill_in "project_catch_copy_2", with: "catch_copy_2"
      fill_in "project_catch_copy_3", with: "catch_copy_3"
      fill_in "project_target_amount", with: "10000"
      fill_in "project_start_date", with: "002032-7-20"
      fill_in "project_end_date", with: "002032-8-20"
      attach_file "project_image", "#{Rails.root}/spec/fixtures/test.jpg"
      fill_in_rich_text_area "project_content", with: "プロジェクト説明"
      fill_in "project_returns_attributes_0_return_name", with: "リターン名"
      fill_in "project_returns_attributes_0_return_price", with: "100"
      fill_in "project_returns_attributes_0_return_introduction", with: "リターン説明"
      attach_file "project_returns_attributes_0_return_image", "#{Rails.root}/spec/fixtures/test.jpg"
      click_button "登録する"
    end

    context "必須項目全てを入力したとき" do
      let(:login_user) { user_a }
      let(:project_title) { "新規プロジェクト" }

      it "正常に登録されること" do
        expect(page).to have_selector ".container", text: "新規プロジェクトが作成されました"
      end
    end

    context "プロジェクトタイトルを入力しなかったとき" do
      let(:login_user) { user_a }
      let(:project_title) { "" }

      it "エラーとなること" do
        expect(page).to have_selector ".container", text: "can't be blank"
      end
    end
  end

  describe "プロジェクト詳細表示機能" do
    before do
      visit project_path(project_a)
    end

    it "プロジェクトが表示されること" do
      expect(page).to have_content "プロジェクトA"
    end
  end

  describe "プロジェクト一覧表示機能" do
    before do
      visit projects_path
    end

    it "プロジェクトが表示されること" do
      expect(page).to have_content "プロジェクトA"
    end
  end
end
