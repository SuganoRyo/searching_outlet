require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "#new" do
    let(:user) { create(:user) }

    it '新規登録画面の表示に成功すること' do
      get '/user/new'
      expect(response).to have_http_status(200)
    end
  end

  describe "#create" do
    let(:user) { create(:user) }

    it 'ユーザーが正常に作成されたか' do
      valid_params = { name: user.name, email: user.email, password: user.password, password_confirmation: user.password }
      expect { get '/user/new', params: { user: valid_params } }
    end
  end

  describe "#show" do
    let(:user) { create(:user) }

    before do
      session_params = { session: { email: user.email, password: user.password } }
      post "/login", params: session_params
    end

    it '詳細画面の表示に成功すること' do
      get user_path
      expect(response).to have_http_status(302)
    end
  end

  describe "#edit" do
    let(:user) { create(:user) }

    before do
      session_params = { session: { email: user.email, password: user.password } }
      post "/login", params: session_params
    end

    it '編集画面の表示に成功すること' do
      get "/users/#{user.id}/edit"
      expect(response).to have_http_status(200)
    end
  end

  describe '#update' do
    let(:user) { create(:user) }

    before do
      session_params = { session: { email: user.email, password: user.password } }
      post "/login", params: session_params
    end

    it 'ユーザー正常に編集されたか' do
      valid_params = { email: user.email, password: 'testpassword', password_confirmation: 'testpassword' }
      expect { put "/users/#{user.id}/edit", params: { user: valid_params } }
      expect(response).to have_http_status(200)
    end
  end
end
