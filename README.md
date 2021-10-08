# searching_outlet
近くのコンセント席のあるカフェを探せるアプリです。  
google mapがあるのでmapで住所等を検索せずともカフェのおおよその場所をサイト内で把握することができます。  
レスポンシブ対応しているのでスマホからもご確認いただけます。　　
#### テストアカウント 
メールアドレス:test@gmail.com  
パスワード:testdeusyo  
![スクリーンショット 2021-10-08 10 24 26](https://user-images.githubusercontent.com/83266893/136486810-5e2282a5-a6c4-444c-b281-b27b9c37c202.png)

# 使用技術
・Ruby2.7.4  
・Ruby on Rails6.1.4.1  
・Postgresql13.3  
・Puma  
・Docker/Dcoker-compose  
・Circleci/CI CD  
・Rspec  
・Rubocop  
・Google Maps API  

# 機能一覧
・ユーザー登録、ログイン機能  
・投稿機能  
&emsp;&emsp;・画像投稿(carrierwave)  
&emsp;&emsp;・画像リサイズ(rmagick)  
&emsp;&emsp;・位置情報(geocoder)  
・検索機能(ransack)  
・ページネーション機能(kaminari)  
&emsp;&emsp;・ページ切り替え  

# テスト
・Rubocop  
・Rspec  
&emsp;&emsp;・単体テスト(system)  
&emsp;&emsp;・機能テスト(request)
