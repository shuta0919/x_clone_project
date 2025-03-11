#!/bin/bash
set -e

# Rails固有のプロセスIDを削除
rm -f /app/tmp/pids/server.pid

# コマンドを実行
exec "$@"