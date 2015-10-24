docker run -it -d \
    -e SETTINGS_FLAVOR=swift \
    -e OS_AUTH_URL='https://dal05.objectstorage.service.networklayer.com/auth/v1.0' \
    -e OS_AUTH_VERSION=1 \
    -e OS_USERNAME='my_master_account:my_account' \
    -e OS_PASSWORD='my_api_key' \
    -e OS_CONTAINER='docker-registry' \
    -e GUNICORN_WORKERS=8 \
    -p 127.0.0.1:5000:5000 \
    alevm/registry-swift:0.7.3
