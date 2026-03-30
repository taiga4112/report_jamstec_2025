# JAMSTEC共同研究報告書（2025年度）

本リポジトリは、JAMSTECとの2025年度共同研究に関する報告書をTypstで管理・生成するためのプロジェクトです。

報告書本文は `main.typ` で管理し、生成された `main.pdf` をGitHub Pagesで公開します。

## 報告書の内容

- 文書種別: 共同研究実施報告書
- 対象年度: 2025年度
- 出力形式: PDF

## How to use

[Wiki](https://github.com/mitsuyukiLab/grad_thesis_typst/wiki)にて使い方の詳細を説明していますので、そちらをご覧ください。

## Build with PDF merge

`main.typ` をコンパイルした後に、以下2つのPDFを末尾に連結して `main.pdf` を作るには、次を実行します。

```bash
./build.sh
```

連結対象:

- `fig/20260323_hayashi_jamstecMTG.pdf`
- `fig/20260323_hirukawa_jamstecMTG.pdf`

補足:

- `typst` コマンドが必要です。
- PDF連結には `pdfunite` または `qpdf` が必要です。
- `pdfunite` を使う場合の例: `brew install poppler`

## GitHub Pagesでの公開

GitHub Actionsでは、Typstコンパイル後に2つのPDFを結合した `main.pdf` を生成し、GitHub Pagesへ公開します。

ワークフロー定義:

- `.github/workflows/gh-pages.yaml`