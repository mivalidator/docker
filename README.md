mivalidator docker container
====

[mivalidator](https://github.com/mivalidator/mivalidator) の Docker イメージです。
mivalidator は、[総務省の「みんなのアクセシビリティ評価ツール：miChecker」](https://www.soumu.go.jp/main_sosiki/joho_tsusin/b_free/michecker.html) を改変し、複数プラットフォームでかつモダンブラウザで動作するように改変したものです。

# ビルド

次のコマンドを実行します:

~~~bash
docker build -t mivalidator/mivalidator .
~~~

または DockerHub から入手することができます:

~~~
docker pull mivalidator/mivalidator
~~~

# 実行方法

次のコマンドを実行します:

~~~bash
docker run --rm --name mivalidator -v "$PWD":/home -w /home mivalidator/mivalidator \
  /opt/mivalidator/bin/mivalidator --no-interactive --no-sandbox --lang=ja-JP \
  --html-checker-output-report=hc-report.json \
  --lowvision-output-report=lv-report.json \
  --lowvision-source-image=lv-source.png \
  --lowvision-output-image=lv-output.png \
  "https://www.soumu.go.jp/main_sosiki/joho_tsusin/b_free/michecker.html"
~~~

mivalidator は複数の結果を出力します:

- hv-resport.json: HTML アクセシビリティチェック結果ファイル
- lv-report.json: 視覚チェック結果ファイル
- lv-source.png: ブラウザの表示画像
- lv-output.png: 視覚シミュレーション結果ファイル
