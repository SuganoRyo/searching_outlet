require 'rails_helper'

RSpec.describe "Caves", type: :request do
  describe "#new" do
    let(:cafe) { create(:cafe) }
    let(:user) { create(:user) }

    before do
      session_params = { session: { email: user.email, password: user.password } }
      post "/login", params: session_params
    end

    it 'カフェ登録画面の表示に成功すること' do
      get '/caves/new'
      expect(response).to have_http_status(200)
    end
  end

  describe "#create" do
    let(:cafe) { create(:cafe) }
    let(:user) { create(:user) }

    before do
      session_params = { session: { email: user.email, password: user.password } }
      post "/login", params: session_params
    end

    it 'カフェ作成に成功すること' do
      valid_params = { image: cafe.image, name: cafe.name, address: cafe.address, number_seats: cafe.number_seats }
      expect { post '/caves/new', params: { cafe: valid_params } }
      expect(response).to have_http_status(200)
    end
  end

  describe "#show" do
    let(:cafe) { create(:cafe) }
    let(:user) { create(:user) }

    before do
      session_params = { session: { email: user.email, password: user.password } }
      post "/login", params: session_params
    end

    it 'カフェ詳細画面の表示に成功すること' do
      get "/caves/#{cafe.id}"
      expect(response).to have_http_status(200)
    end
  end

  describe "#edit" do
    let(:cafe) { create(:cafe) }
    let(:user) { create(:user) }

    before do
      session_params = { session: { email: user.email, password: user.password } }
      post "/login", params: session_params
    end

    it 'カフェ編集画面の表示に成功すること' do
      get "/caves/#{cafe.id}/edit"
      expect(response).to have_http_status(200)
    end
  end

  describe "#update" do
    let(:cafe) { create(:cafe) }
    let(:user) { create(:user) }

    before do
      session_params = { session: { email: user.email, password: user.password } }
      post "/login", params: session_params
    end

    it 'カフェの編集に成功すること' do
      get "/caves/#{cafe.id}/edit"
      valid_params = { image: cafe.image, name: cafe.name, address: cafe.address, number_seats: cafe.number_seats }
      expect { put "/caves/#{cafe.id}", params: { cafe: valid_params } }
      expect(response).to have_http_status(200)
    end
  end
end
