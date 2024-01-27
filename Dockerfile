FROM alpine:latest 

RUN mkdir -p /tmp /etc/otelcol-contrib

ARG USER_UID=10001
USER ${USER_UID}


#mkdir -p otelcol-contrib
#curl -L https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.91.0/otelcol-contrib_0.91.0_linux_amd64.tar.gz | tar xz -C otelcol-contrib
#docker cp $(docker create ghcr.io/open-telemetry/opentelemetry-collector-contrib/telemetrygen):/telemetrygen ./otelcol-contrib/telemetrygen 

COPY ./otelcol-contrib/otelcol-contrib /bin/otelcol-contrib
COPY ./otelcol-contrib/telemetrygen /bin/telemetrygen
COPY ./otel-collector-config.yaml /etc/otelcol-contrib/config.yaml
EXPOSE 4317 55680 55679

CMD ["/bin/otelcol-contrib","--config", "/etc/otelcol-contrib/config.yaml"]
