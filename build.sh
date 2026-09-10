docker run --rm --privileged \
    -v ~/.docker:/root/.docker \
    homeassistant/amd64-builder \
    --amd64 \
    -r https://github.com/guerrerotook/hassio-apcupsd.git \
    -b master \
    -t apcupsd_net
