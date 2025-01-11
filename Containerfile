ARG FEDORA_VERSION="${FEDORA_VERSION:-41}"
ARG IMAGE_REGISTRY="${IMAGE_REGISTRY:-ghcr.io/ublue-os}"
ARG KERNEL_FLAVOR="${KERNEL_FLAVOR:-main}"

# FROMs for copying
ARG AKMODS="${IMAGE_REGISTRY}/akmods:${KERNEL_FLAVOR}-${FEDORA_VERSION}"
ARG CONFIG="${IMAGE_REGISTRY}/config:latest"
FROM ${AKMODS} AS akmods
FROM ${CONFIG} AS config

FROM quay.io/fedora/fedora-bootc:$FEDORA_VERSION

COPY build_files/*.sh /tmp
COPY sys_files/* /

RUN --mount=type=bind,from=akmods,src=/rpms/ublue-os,dst=/tmp/rpms/akmods \
    --mount=type=bind,from=config,src=/rpms,dst=/tmp/rpms/config \
    mkdir -p /var/lib/alternatives && \
    /tmp/build.sh && \
    dnf clean all && \
    bootc container lint
