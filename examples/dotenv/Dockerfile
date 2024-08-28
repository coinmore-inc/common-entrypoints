FROM alpine:3

ADD --chmod=755 https://raw.githubusercontent.com/coinmore-inc/common-entrypoints/v2/entrypoint-dotenv.sh /entrypoint.sh

VOLUME [ "/etc/.env" ]
ENTRYPOINT ["/entrypoint.sh"]