require 'rails_helper'

RSpec.describe User, type: :system do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }

  describe 'User CRUD' do
    describe 'ログイン前' do
      describe 'ユーザー新規登録' do
        context 'フォームの入力値が正常' do
          it 'ユーザーの新規作成が成功' do
            visit new_users_path
            fill_in 'user[name]', with: 'test'
            fill_in 'user[email]', with: 'test@example.com'
            fill_in 'user[password]', with: 'password'
            fill_in 'user[password_confirmation]', with: 'password'
            within('.field_other') do
              click_button '新規登録'
            end
            expect(current_path).to eq caves_path
            expect(page).to have_content '新規登録しました。'
          end
        end

        context 'メールアドレス未記入' do
          it 'ユーザーの新規作成が失敗' do
            visit new_users_path
            fill_in 'user[name]', with: 'test'
            fill_in 'user[email]', with: nil
            fill_in 'user[password]', with: 'password'
            fill_in 'user[password_confirmation]', with: 'password'
            within('.field_other') do
              click_button '新規登録'
            end
            expect(current_path).to eq users_path
            expect(page).to have_content "メールアドレスを入力してください"
          end
        end

        context '登録済メールアドレス' do
          it 'ユーザーの新規作成が失敗する' do
            visit new_users_path
            fill_in 'user[name]', with: 'test'
            fill_in 'user[email]', with: user.email
            fill_in 'user[password]', with: 'password'
            fill_in 'user[password_confirmation]', with: 'password'
            within('.field_other') do
              click_button '新規登録'
            end
            expect(current_path).to eq users_path
            expect(page).to have_content "メールアドレスはすでに存在します"
          end
        end
      end
    end

    describe 'ログイン後' do
      describe 'ユーザー編集' do
        context 'フォームの入力値が正常' do
          describe 'ユーザー編集' do
            context 'フォームの入力値が正常' do
              before { login(user) }

              it 'ユーザーの編集が成功' do
                visit edit_user_path(user)
                fill_in 'user[name]', with: 'test'
                fill_in 'user[email]', with: 'test@example.com'
                fill_in 'user[password]', with: 'password'
                fill_in 'user[password_confirmation]', with: 'password'
                click_button '編集完了'
                expect(current_path).to eq user_path(user)
                expect(page).to have_content '編集しました。'
              end
            end
          end
        end

        context 'メールアドレス未記入' do
          before { login(user) }

          it 'ユーザーの編集が失敗' do
            visit edit_user_path(user)
            fill_in 'user[name]', with: 'test'
            fill_in 'user[email]', with: nil
            fill_in 'user[password]', with: 'password'
            fill_in 'user[password_confirmation]', with: 'password'
            click_button '編集完了'
            expect(current_path).to eq user_path(user)
            expect(page).to have_content "編集に失敗しました。"
          end
        end
      end
    end
  end
end
