#!/bin/sh
set -e

until mc alias set minio http://$MINIO_HOST:$MINIO_PORT $MINIO_ROOT_USER $MINIO_ROOT_PASSWORD
do
  echo "Ожидание доступности MinIO..."
  sleep 2
done

echo "Создание бакета..."
mc mb minio/$MINIO_BUCKET --ignore-existing
mc policy set public minio/$MINIO_BUCKET

echo "Загрузка тестовых данных..."
mc cp -r /test-data/ minio/$MINIO_BUCKET/

echo "Проверка загруженных данных..."
FILE_COUNT=$(mc ls minio/$MINIO_BUCKET_NAME/test-data/ | wc -l)
if [ "$FILE_COUNT" -eq "0" ]; then
  echo "ОШИБКА: Файлы не загружены!"
  exit 1
fi

echo "Успешно загружено $FILE_COUNT файлов"
exit 0