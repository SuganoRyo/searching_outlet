require 'rails_helper'

RSpec.describe Cafe, type: :system do
  let(:user) { create(:user) }
  let!(:cafe) { create(:cafe) }

  describe 'Cafe CRUD' do
    describe 'カフェ新規登録' do
      context 'フォームの入力値が正常' do
        before { login(user) }

        it 'カフェの新規作成が成功' do
          visit new_cafe_path
          attach_file "cafe[image]", "#{Rails.root}/spec/factories/images/test.jpg"
          fill_in 'cafe[name]', with: 'testcafe'
          fill_in 'cafe[address]', with: '東京都渋谷区'
          fill_in 'cafe[number_seats]', with: 10
          click_button 'commit'
          expect(current_path).not_to eq cafe_path(cafe.id)
          expect(page).to have_content '登録しました'
        end
      end

      context 'カフェ名が未記入' do
        before { login(user) }

        it 'カフェの新規作成が失敗' do
          visit new_cafe_path
          attach_file "cafe[image]", "#{Rails.root}/spec/factories/images/test.jpg"
          fill_in 'cafe[name]', with: nil
          fill_in 'cafe[address]', with: '東京都渋谷区'
          fill_in 'cafe[number_seats]', with: 10
          click_button 'commit'
          expect(current_path).to eq caves_path
          expect(page).to have_content "店名を入力してください"
        end
      end
    end

    describe 'カフェ編集' do
      context 'フォームの入力値が正常' do
        describe 'カフェ編集' do
          context 'フォームの入力値が正常' do
            before { login(user) }

            it 'カフェの編集が成功' do
              visit edit_cafe_path(cafe.id)
              attach_file "cafe[image]", "#{Rails.root}/spec/factories/images/test.jpg"
              fill_in 'cafe[name]', with: 'test_a.cafe'
              fill_in 'cafe[address]', with: '東京都渋谷区'
              fill_in 'cafe[number_seats]', with: 10
              click_button 'commit'
              expect(current_path).to eq cafe_path(cafe.id)
              expect(page).to have_content '更新しました'
            end
          end
        end
      end

      context 'カフェ名未記入' do
        before { login(user) }

        it 'カフェの編集が失敗' do
          visit edit_cafe_path(cafe.id)
          attach_file "cafe[image]", "#{Rails.root}/spec/factories/images/test.jpg"
          fill_in 'cafe[name]', with: nil
          fill_in 'cafe[address]', with: '東京都渋谷区'
          fill_in 'cafe[number_seats]', with: 10
          click_button 'commit'
          expect(current_path).to eq cafe_path(cafe.id)
          expect(page).to have_content "店名を入力してください"
        end
      end
    end
  end
end
