# クラウドファンディングシミュレーションアプリ「Shoma Cafe」

気軽にクラウドファンディングを体験できるクラウドファンディングシミュレーションアプリです。  
プロジェクトを始めたいユーザー向けの「プロジェクト作成機能」、応援したいユーザー向けの「プロジェクト応援機能」が備わっております。  
　　　<img src="https://user-images.githubusercontent.com/97627380/182097061-620388e3-5a3b-4fb5-ad75-7796b922d759.png" width="700"> 

## 制作背景

私は以前クラウドファンディングサイト「Makuake」にてプロジェクトを実施した経験があるのですが、その際にいきなりプロジェクトを始めることに少し不安を感じました。  
ですので、そういった本番プロジェクトを始める前に「クラウドファンディングを気軽に始められるアプリ」があれば良いと思い制作に至りました。

## 使い方
#### 【プロジェクトを始める】
プロジェクトの登録フォームにプロジェクトの詳細、リターンの詳細(購入して欲しいもの)を記入して登録するとプロジェクトページを作成することができます。  
プロジェクトページでは、登録した情報が表示されるだけでなく、サポーターのアクションによる「応援総額」や「達成率」、「残り日数」などがリアルタイムで表示されます。  
<img src="https://user-images.githubusercontent.com/97627380/182127666-9cc1c181-31fd-41de-b71d-8b63ec4b18f4.gif" width="700">  


#### 【プロジェクトを応援する】
プロジェクトページを訪れるとユーザーはそのプロジェクトを応援することができます。「これいいな」と思ったら気軽に「応援する」ボタンで応援することができます。  
<img src="https://user-images.githubusercontent.com/97627380/182135789-dd38b79c-b7fa-48d2-9cfd-fc93cb72ddcd.gif" width="700">  

応援したらプロジェクトページに反映されます。  
<img src="https://user-images.githubusercontent.com/97627380/182136750-b35732cc-0752-4543-8ce0-e8320ae2ef3e.png" width="700">  



## 使用技術
- Ruby 2.7.6  
- Ruby on Rails 6.1.5  
- MySQL 5.7  
- Nginx  
- Puma  
- AWS  
  - VPC  
  - RDS  
  - EC2  
  - Route53  
  - S3  
  - ACM  
  - ALB  
  - IAM  
- Capistrano  
- RSpec  

## AWS構成図

<img src="https://user-images.githubusercontent.com/97627380/182158853-4548ed48-7c8e-4645-845e-d669042fa35f.png" width="600"> 

## 機能一覧
- ユーザー登録、ログイン機能(devise)  
- ゲストユーザーログイン機能  
- プロジェクト登録機能(CRUD)  
  - 画像投稿機能(carrierwave)  
  - リターン登録機能(cocoon)  
  - 登録済みプロジェクト一覧表示機能  
  - プロジェクト編集機能  
- プロジェクト応援機能(CRUD)  
  - 応援済みプロジェクト一覧表示機能  
- コメント機能(CRUD)  
- 検索機能(ransack)  


## テスト
- 単体テスト(model spec)  
- 機能テスト(request spec)  
- 統合テスト(system spec)

