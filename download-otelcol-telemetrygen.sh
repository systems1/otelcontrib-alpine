#download otelcol-contrib
mkdir -p otelcol-contrib
curl -L https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.91.0/otelcol-contrib_0.91.0_linux_amd64.tar.gz | tar xz -C otelcol-contrib

#copy telemetrygen to localhost
docker cp $(docker create ghcr.io/open-telemetry/opentelemetry-collector-contrib/telemetrygen):/telemetrygen ./otelcol-contrib/telemetrygen 
