# 中級ミクロデータサイエンス期末レポート

廣江友哉

学籍番号：2125178

## Problem Set 1 について

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

## Problem Set 2 について

出題時にいただいた`master.csv`ファイルは、`/src/build/master/output/master.csv` に保存しています。本来自分がデータの整形をしていたらこのパスにデータが格納されているはずなので、このようにしました。

### レポート本体

- `src/report/problem_set_2.pdf`

### 分析に使用したコード

- master.csv の整形 `src/build/table_1/code/build.R`
- 記述統計 `src/analyze/code/descriptive_statistics/*`
- 回帰分析 `src/analyze/code/regression_analysis/analyze.R`

### 分析結果の画像の場所

- 表 `src/analyze/output/table/*`
- 図 `src/analyze/output/figure/*`

## Problem Set 3 について

## ディレクトリ構成

```
src
├── admin
│   ├── functions
│   │   ├── basics.R
│   │   ├── df_modules.R
│   │   └── plot_modules.R
│   ├── initialize
│   │   └── admin.R
│   ├── master
│   │   └── admin.R
│   └── packages
│       └── admin.R
├── analyze
│   ├── code
│   │   ├── descriptive_statistics
│   │   │   ├── 4yr_gradrate_trend
│   │   │   │   └── analyze.R
│   │   │   ├── scatter_plot
│   │   │   │   └── analyze.R
│   │   │   ├── semester_rate_trend
│   │   │   │   └── analyze.R
│   │   │   └── table
│   │   │       └── analyze.R
│   │   └── regression_analysis
│   │       └── analyze.R
│   └── output
│       ├── code.png
│       ├── figure
│       │   ├── gradrate_trend.png
│       │   ├── lm_result_plot.png
│       │   ├── lm_result_table.png
│       │   ├── scatter_plots.png
│       │   └── semester_trend.png
│       └── table
│           └── table_1.png
├── build
│   ├── covariates_ready
│   │   ├── code
│   │   │   └── build.R
│   │   └── output
│   │       └── covariates_ready_data.rda
│   ├── covariates_tidy
│   │   ├── code
│   │   │   └── build.R
│   │   └── output
│   │       └── covariates_data.rda
│   ├── gradrate_ready
│   │   ├── code
│   │   │   └── build.R
│   │   └── output
│   │       └── gradrate_ready_data.rda
│   ├── gradrate_tidy
│   │   ├── code
│   │   │   └── build.R
│   │   └── output
│   │       └── gradrate_data.rda
│   ├── master
│   │   ├── code
│   │   │   └── build.R
│   │   └── output
│   │       ├── master.csv
│   │       ├── master_data.csv
│   │       └── master_data.rda
│   ├── semester_dummy_tidy
│   │   ├── code
│   │   │   └── build.R
│   │   └── output
│   │       ├── semester_data.rda
│   │       └── semester_dummy_data.rda
│   └── table_1
│       ├── code
│       │   └── build.R
│       └── output
│           └── intermediate.csv
└── report # レポート用のtexファイルとpdfファイル
    ├── report.pdf
    └── report.tex
```

## 計測

```
github.com/AlDanial/cloc v 1.98  T=0.08 s (276.5 files/s, 541813.2 lines/s)
-------------------------------------------------------------------------------
Language                     files          blank        comment           code
-------------------------------------------------------------------------------
CSV                              3              0              0          42361
R                               18            103            152            358
TeX                              1             47              3             81
-------------------------------------------------------------------------------
SUM:                            22            150            155          42800
-------------------------------------------------------------------------------

```
