require 'rails_helper'

RSpec.describe "Purchases", type: :request do
  let(:user) { create(:user) }
  let!(:project) { create(:project) }
  let!(:project_params) { attributes_for(:project) }
  let(:purchase) { create(:purchase) }
  let(:purchase_params) { attributes_for(:purchase) }
  let(:invalid_purchase_params) { attributes_for(:purchase, return_name: "") }

  before do
    sign_in user
  end

  describe "リターン応援登録機能" do
    it "302レスポンスを返すこと" do
      post purchases_path, params: { purchase: purchase_params }
      expect(response).to have_http_status 302
    end

    it "createが成功すること" do
      expect do
        post purchases_path, params: {purchase: purchase_params }
      end.to change(Purchase, :count).by (1)
    end

    it '応援済みプロジェクト一覧ページにリダイレクトされること' do
      post purchases_path, params: { purchase: purchase_params }
      expect(response).to redirect_to purchases_path
    end
  end

  describe "応援済みプロジェクト一覧表示機能" do
    it "200レスポンスを返すこと" do
      get purchases_path
      expect(response).to have_http_status(200)
    end
  end
end
