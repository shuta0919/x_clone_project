FROM node:18-alpine

WORKDIR /app

# エントリポイントスクリプト
RUN echo '#!/bin/sh' > /usr/local/bin/entrypoint.sh && \
    echo 'if [ ! -f /app/package.json ]; then' >> /usr/local/bin/entrypoint.sh && \
    echo '  echo "package.jsonが見つかりません。一時的なファイルをコピーします。"' >> /usr/local/bin/entrypoint.sh && \
    echo '  echo "{\"name\":\"x-clone-frontend\",\"private\":true,\"version\":\"0.0.0\",\"scripts\":{\"dev\":\"vite\"},\"dependencies\":{}}" > /app/package.json' >> /usr/local/bin/entrypoint.sh && \
    echo 'fi' >> /usr/local/bin/entrypoint.sh && \
    echo 'exec "$@"' >> /usr/local/bin/entrypoint.sh && \
    chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
EXPOSE 5173

CMD ["sh", "-c", "if [ -f node_modules/.bin/vite ]; then npm run dev -- --host 0.0.0.0; else echo 'フロントエンド環境を準備するには: docker compose exec frontend npm create vite@latest . -- --template react-ts' && tail -f /dev/null; fi"]