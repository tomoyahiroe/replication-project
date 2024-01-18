# 中級ミクロデータサイエンスレポート

廣江友哉

学籍番号：2125178

## 提出物の確認方法

1. `git clone https://github.com/tomoyahiroe/replication-project.git` で、このリポジトリを自分の環境に落とす
2. R のバージョンを 4.3 以上にする
3. 以下のコードを、R RISP 環境もしくは RStudio コンソールで実行

```R
source("src/admin/packages/admin.R")
source("src/admin/master/admin.R")
```

4. `src/build/[各課題フォルダ]/output/`に最新のデータが rda 形式で生成されます。
5. 最終的なデータは、`src/build/master/output/master.rda` に格納予定です。

本来は `.gitignore` した方が良いと思うのですが、課題で結果のデータがあらかじめ github に上がっていた方が確認しやすいかなと思ったので、output フォルダにはあらかじめ自分が実行した結果得られたデータが格納されています。

## ディレクトリ構成

```
src/
├── admin
│   ├── functions # 再利用可能な関数
│   ├── initialize # Rコンソールの初期化
│   ├── master # エントリーポイント
│   └── packages # パッケージのインストール
├── analyze
├── build # データの整形
│   ├── covariates_ready
│   ├── covariates_tidy
│   ├── gradrate_ready
│   ├── gradrate_tidy
│   ├── master
│   └── semester_dummy_tidy
```
