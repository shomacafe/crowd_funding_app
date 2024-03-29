require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user) { create(:user) }
  let(:user_params) { attributes_for(:user) }
  let(:invalid_user_params) { attributes_for(:user, name: "") }

  describe "POST #create" do
    context "パラメータが正当な場合" do
      it "リクエストが成功すること" do
        post user_registration_path, params: { user: user_params }
        expect(response.status).to eq 302
      end

      it "createが成功すること" do
        expect do
          post user_registration_path, params: { user: user_params }
        end.to change(User, :count).by 1
      end

      it 'リダイレクトされること' do
        post user_registration_path, params: { user: user_params }
        expect(response).to redirect_to root_path
      end
    end
    
    context "パラメータが不正な場合" do
      it "リクエストが成功すること" do
        post user_registration_path, params: { user: invalid_user_params }
        expect(response.status).to eq 200
      end

      it "createが失敗すること" do
        expect do
          post user_registration_path, params: { user: invalid_user_params }
        end.to_not change(User, :count)
      end

      it "エラーが表示されること" do
        post user_registration_path, params: { user: invalid_user_params }
        expect(response.body).to include "ユーザー名を入力してください"
      end
    end
  end

  describe "GET #edit" do
    subject { get edit_user_registration_path }
    context "ログインしている場合" do
      before do
        sign_in user
      end
      it "リクエストが成功すること" do
        is_expected.to eq 200
      end
    end

    context 'ゲストの場合' do
      it 'リダイレクトされること' do
        is_expected.to redirect_to new_user_session_path
      end
    end
  end

  describe "PUT #update" do
    it "リクエストが成功すること" do
      put user_registration_path, params: { user: user_params }
      expect(response.status).to eq 302
    end
  end

  describe "GET #profile" do
    subject { get profile_users_path }
    before do
      sign_in user
    end
    
    it "リクエストが成功すること" do
      is_expected.to eq 200
    end
  end
end
