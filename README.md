# トトノイマシタ

## サイトについて
### 概要
サウナーのためのコミュニティ投稿サイト

### テーマ
サウナ初心者がもっとサウナに行きたいと思うアプリケーション

### テーマを選んだ理由
私はととのう事に魅力を感じており、頻繁にサウナに通っています。  
しかし、新型コロナウイルスがきっかけでサウナ人口が減っており、特に数ヶ月に一回通うライトサウナーの離脱が顕著であります。  
そこで、特にライトサウナーがもっとサウナに通いたいと思い、サウナに対するモチベーションが少しでも上がるアプリケーションを作成しました。  
行きつけのサウナ施設毎にコミュニティを作成してサ活状況を共有したり、サ活回数などを記録するなど自分の履歴を見える化するようにしました。  

### ターゲットユーザ
サウナー、サウナに興味のある人

### 主な利用シーン
・近所のサウナを探して、常連さんから情報を入手
・行きつけのサウナでコミュニティを作成し、サ活状況を共有
・サ活回数などを記録し、自分の履歴を見える化


## 機能一覧
・ログイン、ログアウト機能. 
・ユーザー認証機能(devise). 
・ゲストログイン機能. 
・コミュニティの新規作成、編集、退会、削除. 
・サ活情報の投稿、編集、削除. 
・コミュニティの検索機能. 
・いいね機能の非同期通信(Ajax). 
・コメント機能の非同期通信(Ajax). 
・ページネーション機能. 
・地図表示機能(Google Maps API). 
・ユーザー管理機能（管理者）. 

## 設計書
ER図：https://app.diagrams.net/#G1_OalzYH0pPt4ZIifkpf03EzMc3C_SSUZ

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9