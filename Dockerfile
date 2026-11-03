FROM alpine:3.20

ARG XRAY_VERSION=v26.3.27

RUN apk add --no-cache ca-certificates curl unzip tzdata && \
    curl -fsSL -o /tmp/xray.zip "https://github.com/XTLS/Xray-core/releases/download/${XRAY_VERSION}/Xray-linux-64.zip" && \
    mkdir -p /usr/local/share/xray && \
    unzip -o /tmp/xray.zip -d /usr/local/share/xray && \
    chmod +x /usr/local/share/xray/xray && \
    rm /tmp/xray.zip

COPY config.template.json /usr/local/share/xray/config.template.json
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
