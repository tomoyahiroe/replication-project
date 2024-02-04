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

### コードの実行方法

- blank_result ブランチへ移動

画像などのデータを削除してあるブランチです。コードの挙動を確かめるのに使えると思います。

```{bash}
git checkout -b blank_result

git pull origin blank_result
```

- (できれば CLI で replication-project まで移動して R を実行)

最初に R セッションを開始すると、めちゃくちゃパッケージのインストールが始まります。(多分)

```{bash}
R
```

```{r}
source("src/admin/master/admin.R")
```

上記のコードを実行すれば、必要な画像等のデータは output フォルダ内に出現するはずです。

### 分析結果の画像の場所

- 表 `src/analyze/output/table/*`
- 図 `src/analyze/output/figure/*`

## Problem Set 3 について

### レポート本体

- `src/report/problem_set_3.pdf`

### 分析に使用したコード

- `src/analyze/code/problem_set_3/*`

### コードの実行方法

Problem_Set_2 と同じです。

### 分析結果の画像の場所

- 表 `src/analyze/output/table/*`
- 図 `src/analyze/output/figure/*`

## 分析環境についての説明

- renv と pacman

プロジェクトごとにパッケージを管理し他者と環境を共有するために renv パッケージを使用しています。また、煩雑な依存関係周りのエラーが減ることを祈って pacman パッケージを使用しています。

- .Rprofile ... セッション開始時に実行されます。

renv のアクティベートと、初期化ファイルを読み込んでいます。

```{r}
source("renv/activate.R")
# source("src/admin/packages/admin.R")
source("src/admin/initialize/admin.R")
```

ファイルの中身は以下の通りで、[Peanuts Data Project](https://github.com/Chishio318/Peanuts-Data-Project)を参考にしました。
個人的に追加したのは、perepare_japanese()でプロット内の日本語の文字化けを防ぐために、google-font を使用しています。

```{r}
main <- function(){
  set_error_to_English()
  prepare_packages()
  prepare_japanese()
}

set_error_to_English <- function(){
  Sys.setenv(LANG = "en_US.UTF-8")
}

prepare_packages <- function(){
  renv::restore()
  #devtools::update_packages(packages = TRUE)
  library(magrittr)
  library(here)
  # tinytex::install_tinytex()
  ggplot2::theme_set(ggplot2::theme_light())
  options(box.path = here::here("src/admin"))
}

prepare_japanese <- function() {
  ## Loading Google fonts (https://fonts.google.com/)
  sysfonts::font_add_google("Gochi Hand", "gochi")
  sysfonts::font_add_google("Schoolbell", "bell")

  ## Automatically use showtext to render text
  showtext::showtext_auto()
}

main()
```

- box パッケージと`src/admin/functions/*`

`src/admin/functions/*` に使い回せそうな関数を定義して、box パッケージを使用して別ファイルで使用できるように設定しています。
これも[Peanuts Data Project](https://github.com/Chishio318/Peanuts-Data-Project)を参考にしました。

box パッケージの設定は、先ほどの初期化ファイルで行なっています。

## ディレクトリ構成

### build

master.csv の整形のために作成しました。

```
src/build/table_1
├── code
│   └── build.R
└── output
    └── intermediate.csv
```

### analyze

code フォルダ内に、`descriptive_statistics`, `regression_analysis`, `problem_set_3`という 3 つのフォルダがあります。
それぞれ、Problem_Set_2 の a、b, Problem_Set_3 に対応しています。

```
src/analyze/code
├── descriptive_statistics
│   ├── 4yr_gradrate_trend
│   │   └── analyze.R
│   ├── scatter_plot
│   │   └── analyze.R
│   ├── semester_rate_trend
│   │   └── analyze.R
│   └── table
│       └── analyze.R
├── problem_set_3
│   ├── 01_simulate
│   │   └── analyze.R
│   ├── 02_estimate
│   │   ├── analyze.R
│   │   ├── histgram
│   │   │   └── analyze.R
│   │   ├── kdensity
│   │   │   └── analyze.R
│   │   └── quantile_regression
│   │       └── analyze.R
│   └── 03_nonlinear
└── regression_analysis
    └── analyze.R
```

### report

latex で書いたレポートをコンパイルして pdf にしています。

```
src/report
├── problem_set_2.pdf
├── problem_set_2.synctex.gz
├── problem_set_2.tex
├── problem_set_3.pdf
├── problem_set_3.synctex.gz
├── problem_set_3.tex
└── report.synctex.gz
```

## 計測(cloc)

```
github.com/AlDanial/cloc v 1.98  T=0.06 s (470.0 files/s, 702276.1 lines/s)
-------------------------------------------------------------------------------
Language                     files          blank        comment           code
-------------------------------------------------------------------------------
CSV                              3              0              0          42361
R                               23            141            176            457
TeX                              3             67              4            123
-------------------------------------------------------------------------------
SUM:                            29            208            180          42941
-------------------------------------------------------------------------------

```
