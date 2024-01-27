#build.sh download and build otelcontrib-alpine

#otelcontrib.0.91.0 image with alpine linux and telemetrygen for network troubleshooting
docker run -it --rm -v ./otel-collector-config.yaml:/etc/otel/config.yaml  -p 4317:4317  systems1/otelcontrib-alpine
#docker run -it --rm -v ./otel-custom-config.yaml:/etc/otel/config.yaml  -p 4317:4317  systems1/otelcontrib-alpine


#run commands inside alpine container
docker exec -it containerid sh 
$telemetrygen --help


#check with telemetrygen 
telemetrygen  logs --otlp-insecure 1
telemetrygen metrics --duration 1s --otlp-insecure
telemetrygen traces --otlp-insecure --traces 1
telemetrygen logs --duration 1s --otlp-insecure
