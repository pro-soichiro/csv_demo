# README

## 参考
slim導入
https://qiita.com/ngron/items/c03e68642c2ab77e7283

seed
https://qiita.com/ren0826jam/items/b589171502df87e40234

csv
https://medium-company.com/csv-generate-rails/

csv方法3種類
https://tisnote.com/ruby-on-rails-csv/

## heroku deploy step
herokuはinstall済みとする
### 参考
https://railstutorial.jp/chapters/beginning?version=5.1#sec-deploying
https://devcenter.heroku.com/ja/articles/getting-started-with-ruby#-4
herokuにpgのバージョンがちげえよと言われた時
https://qiita.com/sakashi/items/6b345fd558802c77083c


1. fix gemfile
  herokuではsqliteがサポートされていないため、本番環境にはpostgreSQLを使う。
  開発とテスト環境ではsqliteを使うようにする
  ```ruby
  group :development, :test do
    gem 'sqlite3', '1.3.13'
    gem 'byebug',  '9.0.6', platform: :mri
  end

  group :production do
    gem 'pg', '0.20.0'
  end
  ```
2. 本番以外のgemをインストールし、commitする

  ```bash
  $ bundle install --without production
  $ git commit -a -m "Update Gemfile for Heroku"
  ```

3. herokuにloginし、新しいアプリケーションを作成する
  ```
  $ heroku login
  $ heroku create
  ```
4. Gitを使ってherokuにリポジトリをpushする
  ```
  $ git push heroku main
  ```

### herokuコマンド
```bash
$ heroku open
$ heroku domains
# 名前を変更できるが「_」は使えない
$ heroku rename [NEWAPPNAMW]
$ heroku help
$ heroku logs --tail
# コミットした後、herokuにdeploy
$ git push heroku main
```
