require 'rails_helper'

RSpec.describe "Purchases", type: :system do
  let!(:user) { create(:user, email: "a@example.com") }
  let!(:project) { create(:project, title: "プロジェクトA", start_date: Date.today, returns: [returns], purchases: [purchases] ) }
  let!(:returns) { create(:return) }
  let!(:purchases) { create(:purchase) }

  context "応援機能" do
    before(:each) do
      visit new_user_session_path
      fill_in "user_email", with: "a@example.com"
      fill_in "user_password", with: "testuser"
      click_button "ログイン"
      visit project_path(project.id)
    end

    it "確認ページにリターンが表示されること" do
      click_button "応援する"
      expect(page).to have_content(returns.return_name)
      expect(page).to have_content(returns.return_price.to_s(:delimited))
      expect(page).to have_content(returns.return_introduction)
    end

    it "正常に登録されること" do
      click_button "応援する"
      click_button "確定する"
      expect(page).to have_selector ".container", text: "応援が完了しました"
    end

    it "応援済みリターンが表示されること" do
      click_button "応援する"
      click_button "確定する"
      expect(page).to have_content("プロジェクトA")
      expect(page).to have_content(returns.return_name)
      expect(page).to have_content(returns.return_price.to_s(:delimited))
    end
  end
end
