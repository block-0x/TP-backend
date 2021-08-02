# backend

「rails-react-matching-app」のバックエンド。

## セットアップ

```
$ docker-compose build
$ docker-compose up -d
$ docker-compose run api rails db:create
$ docker-compose run api rails db:migrate
$ docker-compose run api rails db:seed
```

[http://localhost/3001](http://localhost/3001)
