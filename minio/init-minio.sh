#!/bin/sh
set -e

until mc alias set minio http://$MINIO_HOST:$MINIO_PORT $MINIO_ROOT_USER $MINIO_ROOT_PASSWORD
do
  echo "Waiting for MinIO to become available..."
  sleep 1
done

echo "Creating bucket..."
mc mb minio/$MINIO_BUCKET --ignore-existing
mc policy set public minio/$MINIO_BUCKET

echo "Uploading test data..."

TOTAL_FILES=$(find /test-data -type f | wc -l)
echo "Found $TOTAL_FILES files to upload"

mc cp -r /test-data/ minio/$MINIO_BUCKET/test-data/

echo "Verifying uploaded data..."

LOADED_FILES=$(mc ls -r minio/$MINIO_BUCKET/test-data/ | wc -l)

if [ "$LOADED_FILES" -ne "$TOTAL_FILES" ]; then
  echo "ERROR: uploaded only $LOADED_FILES/$TOTAL_FILES files"
  exit 1
fi

echo "Successfully uploaded $LOADED_FILES/$TOTAL_FILES files"
exit 0