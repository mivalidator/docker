mivalidator docker container
====

This is docker container for [mivalidator](https://github.com/mivalidator/mivalidator).
mivalidator is a html linter tool which is derived and personaly modified version of [miChecker: The Ministry of Internal Affairs and Communications' "Everyone’s Public Website Operational Guidelines"](https://www.soumu.go.jp/main_sosiki/joho_tsusin/b_free/michecker.html)

# BUILD

run these commands:

~~~bash
docker build -t mivalidator .
~~~

Or you can pull image from DockerHub

~~~
docker pull mivalidator
~~~

# RUN

run these commands:

~~~bash
docker run --rm --name mivalidator -v "$PWD":/home -w /home mivalidator \
  /opt/mivalidator/bin/mivalidator --no-interactive --no-sandbox --lang=ja-JP \
  --html-checker-output-report=hc-report.json \
  --lowvision-output-report=lv-report.json \
  --lowvision-source-image=lv-source.png \
  --lowvision-output-image=lv-output.png \
  "https://www.ss-proj.org/"
~~~

mivalidator generates several results:

- hv-resport.json: html accessibility check results
- lv-report.json: low-vision check results
- lv-source.png: browser image
- lv-output.png: low-vision simulation result.
