FROM ruby:3.4.2-slim

WORKDIR /app

# 必要なパッケージをインストール
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    build-essential \
    libpq-dev \
    nodejs \
    npm \
    libyaml-dev \
    pkg-config \
    git

RUN npm install -g yarn

# エントリポイントスクリプトの設定
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# 初期コマンド - Railsプロジェクトを作成するか、既存のプロジェクトを起動
CMD ["bash", "-c", "if [ ! -f ./bin/rails ]; then echo 'Rails環境を初期化中...' && gem install rails -v 7.2.2.1 && rails new . --api --database=postgresql --skip-git && bundle install; else rm -f tmp/pids/server.pid && bundle exec rails server -p 3000 -b '0.0.0.0'; fi"]