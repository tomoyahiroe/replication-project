# Replication Project

This repository is for my assignment of 'Data Science: intermediate'. I heavily referenced [Peanuts-Data-Project](https://github.com/Chishio318/Peanuts-Data-Project) to create this project. Therefore, This repository have similar strucuture to Peanuts-data-Project.

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
