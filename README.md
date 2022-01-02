# searching_outlet
愛知県内のコンセント席のあるカフェを探せるアプリです。  
google mapがあるのでmapで住所等を検索せずともカフェのおおよその場所をサイト内で把握することができます。  
レスポンシブ対応しているのでスマホからもご確認いただけます。　　
![スクリーンショット 2021-10-08 10 24 26](https://user-images.githubusercontent.com/83266893/136486810-5e2282a5-a6c4-444c-b281-b27b9c37c202.png)

# このアプリを作成して経緯について
私がこのアプリを作成しようと思ったきっかけとしてはプログラミング言語を学習する際に自分自身、家で勉強していて何かやる気の起きない時、エラーでつまずいてしまい中々進めない時、  
そんな時にカフェに自ら足を運んで学習に励むというような機会が多くありその中でカフェを利用するということが多かったのが一番のきっかけです。  
世間によく知られているようなカフェであるスターバックスやタリーズ等はおおよその店舗にwifiやコンセントの席が存在し設備が整っているというような印象を強く受けますが、ではその他のマイナー
であり世間によく知られていないようなカフェはどうなのか？  
穴場であるカフェの情報が知れたら人との混雑も避けることができることやいざカフェに向かったがwifiがなかったりコンセントの付いている席がなかったりすることも避けることができるのではないかと思いこのようなアプリの作成を進めてきました。  

# 使い方に関して
このアプリの使い方としては主に自分が新しく見つけたカフェを新規で登録し、他の利用者の方にも足を運んでもらうべく情報を共有すること。  
また、他の方が掲載しているカフェから自分の地域に合ったカフェの情報を新しく発見することや自分が実際に利用してみてここがよかった等の評価を行うことで他の利用者の方がカフェに対しての
イメージを掴むことができるようにもなります。  
その他にもいいねをすることで自分が実際に訪れてみたカフェを忘れないようにできたり、再度訪れたいと思った際にすぐに住所等を目で確認できるというようなことが行えます。  
![編集済みサンプル mov](https://user-images.githubusercontent.com/83266893/137138584-3eae1c6a-a6e3-4538-a36c-bb2811d29eba.gif)  

# アプリ作成においてこだわった箇所について
私がこのアプリを作成するにあたってこだわったポイントとしてフロントエンドとバックエンドであげさせていただきます。  
始めにフロントエンドは、配色を抑えつつアイコンを多用したことです。  
こだわった理由として、私はサイトの見栄えでサイトのレベルは決まると考えているからです。  
私はこのアプリ作成にあたってさまざな既存サイトを拝見させていただきましたが見やすいと思えるようなサイトというのは色に統一感があったりアイコンやマークを使いながら作成しているように感じました。  
そこでサイトの配色に関しては色をできるだけ3色に抑え、強調した文章に関しては差し色として1色下線で使用することに意識を向けながらサイトに色をつけていきました。  
これによりサイト全体にバランス感を感じますしごちゃごちゃしていて見づらいといったことが改善できたと思っています。  
また、アイコンを多用し文字だけなくアイコンでもイメージがつくようにしました。  
文字のみではリンク等が味気ないことやその遷移先のページのイメージも湧きにくいという問題の解決になったと感じています。  
  
次にバックエンドは、住所からgoogle map上にピンをさせるようにしたことです。  
初めは、ユーザーが新しいカフェを発見し登録したとしても住所の欄が文字のみでの表示でした。  
しかし、文字だけはそのカフェがどこにあるかというイメージが湧きにくいなというように感じました。  
そこでgoogle maps apiを利用させていただき、ユーザーがカフェ登録を行った際には入力した住所からgoogle map上にピンを立てるように改善させていただきました。  
これにより見た目としての雰囲気も良くなったと思いますしユーザーがカフェの詳細を確認した際には文字のみならずgoogle mapとしてもカフェの場所の確認も図るこ  
とができるようになりアプリを使用する手間の改善にもなっていると実感しました。  
  
以上がこのアプリを制作するにあたってこだわったポイントです。  

# 使用技術
・Ruby2.7.4  
・Ruby on Rails6.1.4.1  
・ScrollReveal  
・jQuery  
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
・ゲストユーザー機能  
・いいね機能  
・コメント、レビュー機能  
・ローディング画面  
・管理者機能  

# ER図  
![スクリーンショット 2021-10-14 21 27 42](https://user-images.githubusercontent.com/83266893/137317391-9bdc0ade-2b94-4e46-8cf8-0ac08aa3a867.png)

# テスト
・Rubocop  
・Rspec  
&emsp;&emsp;・単体テスト(system)  
&emsp;&emsp;・機能テスト(request)
