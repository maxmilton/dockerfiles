FROM alpine:3.15
COPY mkimage-alpine.bash /
RUN apk add --no-cache bash tzdata xz
ENTRYPOINT ["bash", "/mkimage-alpine.bash"]
