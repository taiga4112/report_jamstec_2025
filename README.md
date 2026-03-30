# grad_thesis_typst

- 名前: `自分の名前`
- タイトル: `卒論修論タイトル`
- 卒業年度: `卒業年度`
- 所属: `所属(大学・学部・学科・コース)`
- 指導教員:`指導教員`

---

これは、卒論・修論・博論などの卒業論文をTypstで書くためのフォーマットです。
このテンプレートを使ったPDFファイルの仕上がりは，[GitHub PagesのPDFファイル](https://mit.ynu.jp/grad_thesis_typst/main.pdf)をご確認ください。

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