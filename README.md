# vector-store-updater

## Running with docker-compose
```yaml
version: "3"
services:
  vector-store-updater:
    image: vsu
    environment:
        ELASTIC_ENDPOINT: http://elastic:adminadmin@127.0.0.1:9200
        ELASTIC_INDEX: test_index
        EMBEDDINGS_MODEL_NAME: all-MiniLM-L6-v2
        S3_ENDPOINT: "http://127.0.0.1:8333"
        S3_ACCESS_KEY: "adminadmin"
        S3_SECRET_KEY: "adminadmin"
    volumes:
        vector-store-updater:/root/ntlk_data

volumes:
    vector-store-updater:
```