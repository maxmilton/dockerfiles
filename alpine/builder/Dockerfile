FROM alpine:3.14
COPY mkimage-alpine.bash /
RUN apk add --no-cache bash tzdata xz
ENTRYPOINT ["bash", "/mkimage-alpine.bash"]
