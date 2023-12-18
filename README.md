# 中級ミクロデータサイエンス課題

# 参考

このリポジトリは、[Peanuts-Data-Project](https://github.com/Chishio318/Peanuts-Data-Project)を参考にして作成しました。

# ソースコード内のコメントについて

## R 言語に対する不満

多くの言語で Docs コメントを書く習慣があると思います。特定のライブラリを用いるとコメントから自動的にドキュメントを生成してくれるという利点だけでなく、コードレビュワーがコメントの内容とコードの内容を比較することで未然にバグを防いだり、可読性が上がったりと良いことが多いと個人的には思っています。

例えば、PHP であれば PHPDocs があります。

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

[コード引用元](https://docs.phpdoc.org/3.0/guide/references/phpdoc/tags/param.html#param)

このようなことができるパッケージが欲しいと個人的には思います。(自分で作れよと言われたら辛い)

## このリポジトリでもコメント方法

このリポジトリでは、純粋関数には関数のブラケット内にコメントを書いています。

```R
get_absolute_path = function(path) {
## recieve a path from repository root, and return the absolute path
 #
 # @var path string
 # @return string
 ##
  return( here::here(path) )
}
```

# 課題点

R には言語標準のフォーマッター、もしくは、デファクトスタンダードとなっているフォーマッターが存在しないようです。formatR というパッケージは存在しますが、他の言語のフォーマッターと比較すると機能に不十分な点があります。
