# IeiruForiOS(6月30日完成予定)
## 概要
一緒に暮らしている人（家族、友人、恋人）が、今家にいるのかいないのかを判別するアプリ（iOS版）

## 本番環境
画像はPC上で起動しているエミュレーターですが、スマートフォン（iOS）につなげてアプリをダウンロードすると実際に起動できます。
エミュレーターの仕様によりapple本社の位置情報を取得しておりますが、実機ではスマートフォンの位置情報を取得します。  
<img src="/sampleAndroid.png" width="300px">

## 制作背景
現在友人3人と共同生活をしており、各々が在宅であるかどうかを知ることが、ストレスフリーな生活を送るために必要であると考え制作しました。

## 工夫したポイント
•スマートフォンの緯度経度と住まいの緯度経度を比較し、在宅かどうかを判断  
•フォアグランド、バックグランド時の位置情報の取得

## 使用技術
•swift  
•Xcode  

## 課題や今後実装したい技術
実際の私の住まいとデバイスの緯度経度の比較しかできないので、住所登録機能をつけて汎用性を持たせたいと考えております。
