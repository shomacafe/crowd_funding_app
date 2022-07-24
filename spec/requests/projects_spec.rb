require 'rails_helper'

RSpec.describe "Projects", type: :request do
  let(:user) { create(:user) }
  let(:project) { create(:project) }
  let(:project_params) { attributes_for(:project) }
  let(:invalid_project_params) { attributes_for(:project, title: "") }

  before do
    sign_in user
  end
  before do
    @return_params = {
      returns_attributes: {
        "0": FactoryBot.attributes_for(:return)
      }
    }
    @params_nested = { 
      project: FactoryBot.attributes_for(:project).merge( @return_params )
    }
  end

  describe "プロジェクト作成機能" do
    context "パラメータが正当な場合" do
      it "302レスポンスを返すこと" do
        post projects_path, params: @params_nested
        expect(response).to have_http_status 302
      end

      it "createが成功すること" do
        expect do
          post projects_path, params: @params_nested
        end.to change(Project, :count).by (1) and change(Return, :count).by(1)
      end

      it '作成済みプロジェクト一覧ページにリダイレクトされること' do
        post projects_path, params: { project: project_params }
        expect(response).to redirect_to posts_projects_path
      end
    end
    context "パラメータが不正な場合" do
      it "200レスポンスを返すこと" do
        post projects_path, params: { project: invalid_project_params }
        expect(response).to have_http_status 200
      end

      it "createが失敗すること" do
        expect do
          post projects_path, params: { project: invalid_project_params }
        end.to change(Project, :count).by 0
      end
    end
  end

  describe "プロジェクト詳細表示機能" do
    before do
      get project_path(project.id)
    end

    it "200レスポンスを返すこと" do
      expect(response).to have_http_status(200)
    end

    it "responseにタイトルが含まれること" do
      expect(response.body).to include(project.title)
    end

    it "responseに目標金額が含まれること" do
      expect(response.body).to include(project.target_amount.to_s)
    end

    it "responseに画像が含まれること" do
      expect(response.body).to include(project.image.to_s)
    end

    it "responseにキャッチコピー3つが含まれること" do
      expect(response.body).to include(project.catch_copy_1)
      expect(response.body).to include(project.catch_copy_2)
      expect(response.body).to include(project.catch_copy_3)
    end

    it "responseに概要が含まれること" do
      expect(response.body).to include(project.content.to_s)
    end

    it "responseにユーザープロフィールが含まれること" do
      expect(response.body).to include(project.user.profile)
    end

    it "responseにユーザー名が含まれること" do
      expect(response.body).to include(project.user.name)
    end
  end

end
