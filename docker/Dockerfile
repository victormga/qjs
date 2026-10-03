FROM debian:bookworm-slim

ARG WASI_SDK_VERSION=34
ARG WASI_SDK_SHA256=b761e3a0721dbae9c09a0059e5fdb2bf917d1b4a8a7b430fb3b5aafb0984b2c4
ARG BINARYEN_VERSION=133
ARG BINARYEN_SHA256=2dc9c7813f5375db93d96ead4b78222fcc3e2677bbb832297af4797782a37489

RUN apt-get update \
 && apt-get install -y --no-install-recommends ca-certificates curl cmake make git \
 && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL -o /tmp/wasi-sdk.tar.gz \
      "https://github.com/WebAssembly/wasi-sdk/releases/download/wasi-sdk-${WASI_SDK_VERSION}/wasi-sdk-${WASI_SDK_VERSION}.0-x86_64-linux.tar.gz" \
 && echo "${WASI_SDK_SHA256}  /tmp/wasi-sdk.tar.gz" | sha256sum -c - \
 && mkdir /opt/wasi-sdk \
 && tar -xzf /tmp/wasi-sdk.tar.gz -C /opt/wasi-sdk --strip-components=1 \
 && rm /tmp/wasi-sdk.tar.gz \
 && ln -s wasi-sdk-p1.cmake /opt/wasi-sdk/share/cmake/wasi-sdk.cmake

RUN curl -fsSL -o /tmp/binaryen.tar.gz \
      "https://github.com/WebAssembly/binaryen/releases/download/version_${BINARYEN_VERSION}/binaryen-version_${BINARYEN_VERSION}-x86_64-linux.tar.gz" \
 && echo "${BINARYEN_SHA256}  /tmp/binaryen.tar.gz" | sha256sum -c - \
 && mkdir /opt/binaryen \
 && tar -xzf /tmp/binaryen.tar.gz -C /opt/binaryen --strip-components=1 \
 && rm /tmp/binaryen.tar.gz

ENV PATH=/opt/binaryen/bin:$PATH

WORKDIR /tmp
