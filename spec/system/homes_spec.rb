require 'rails_helper'

RSpec.describe "Homes", type: :system do
  let!(:user) { create(:user, email: "a@example.com") }
  let!(:project) { create(:project, title: "プロジェクトA", start_date: "2023-7-26", returns: [returns]) }
  let!(:returns) { create(:return) }
  let!(:related_projects) { create_list(:project, 5, title: "公開中のプロジェクト", start_date: Date.today) }

  it "スライドショーにプロジェクト名が表示されること" do
    visit root_path
    expect(page).to have_selector ".slider", text: "公開中のプロジェクト"
  end

  it "一覧にプロジェクト名が表示されること" do
    visit root_path
    expect(page).to have_selector ".recommendedBase", text: "プロジェクトA"
  end

  it "一覧のプロジェクトをクリックするとそのプロジェクトページに移動すること" do
    visit root_path
    click_on "プロジェクトA"
    expect(current_path).to eq project_path(project.id)
  end

  it "「新しいプロジェクト」一覧にプロジェクトが4点表示されること" do
    visit root_path
    related_projects[0..3].all? do |related_project|
      expect(page).to have_content(related_project.title)
    end
  end

  it "プロジェクトページにリターンが表示されること" do
    visit project_path(project.id)
    expect(page).to have_content(returns.return_name)
    expect(page).to have_content(returns.return_price.to_s(:delimited))
    expect(page).to have_content(returns.return_introduction)
  end
end
