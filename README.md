# Replication Project

This repository is for my assignment of 'Data Science: intermediate'. I heavily referenced [Peanuts-Data-Project](https://github.com/Chishio318/Peanuts-Data-Project) to create this project. Therefore, This repository have similar strucuture to Peanuts-data-Project.

## 提出物の確認方法

1. `git clone` で、このリポジトリを自分の環境に落とす
2. R のバージョンを 4.3 以上にする
3. 以下のコードを、R RISP 環境もしくは RStudio コンソールで実行

```R
source("src/admin/master/admin.R")
```

4. `src/build/[各課題フォルダ]/output/`に最新のデータが rda 形式で生成されます。
5. 最終的なデータは、`src/build/master/output/master.rda` に格納予定です。

本来は `.gitignore` した方が良いと思うのですが、課題で結果のデータがあらかじめ github に上がっていた方が確認しやすいかなと思ったので、output フォルダにはあらかじめ自分が実行した結果得られたデータが格納されています。

## How to check the result

1. set the repository root as working directly
2. excute `R` in terminal or focus on your RStudio console
3. excute the command bellow to load the initial settings

```R
source("src/admin/initialize/admin.R")
```

4. excute the command bellow to run the whole build script.

```R
source("src/admin/master/admin.R")
```

## Complaints about R and RStudio

### 1. RStudio is not vim editor

RStudio is a super convenient IDE. However, it's not vim editor.
So, I stoped using RStudio as much as possible. And now, I use Neovim!
There are no need to leave my hands from keyoboard. Instead, I can't see plots immediately because Neovim is CLI editor.

### 2. RDocs

Recently, many programming languages have libraries for docs comment. For example, PHPDocs is the docs comment library in PHP.
The comment looks like bellow:

```php
/**
 * Counts the number of items in the provided array.
 *
 * @param mixed[] $items     Array structure to count the elements of.
 * @param bool    $recursive Optional. Whether or not to recursively
 *                           count elements in nested arrays.
 *                           Defaults to `false`.
 *
 * @return int Returns the number of elements.
 */
function count(array $items, bool $recursive = false)
{
    <...>
}
```

[Source](https://docs.phpdoc.org/3.0/guide/references/phpdoc/tags/param.html#param)

I eagerly want the library like this for R.

### 3. Formatter for R

No formatter, No coding.
