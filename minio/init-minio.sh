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

mc cp -r /test-data/ minio/$MINIO_BUCKET/