require 'rails_helper'

RSpec.describe "検索機能", type: :system do
  let!(:project) { create(:project, title: "プロジェクトABCD") }

  context "検索フォームにABCDと入力したとき" do
    before(:each) do
      visit root_path
      fill_in "q_title_cont", with: "ABCD"
      click_button "検索"
    end

    it "プロジェクト一覧に移動すること" do
      expect(current_path).to eq projects_path
    end

    it "正しい検索結果を表示すること" do
      expect(page).to have_content "プロジェクトABCD"
    end
  end

  context "検索フォームにDCBAと入力したとき" do
    before(:each) do
      visit root_path
      fill_in "q_title_cont", with: "DCBA"
      click_button "検索"
    end

    it "プロジェクト一覧に移動すること" do
      expect(current_path).to eq projects_path
    end

    it "正しい検索結果を表示すること" do
      expect(page).not_to have_content "プロジェクトABCD"
    end
  end
end
