ARG FEDORA_VERSION="${FEDORA_VERSION:-41}"
ARG IMAGE_REGISTRY="${IMAGE_REGISTRY:-ghcr.io/ublue-os}"
ARG KERNEL_FLAVOR="${KERNEL_FLAVOR:-main}"

# FROMs for copying
FROM "${IMAGE_REGISTRY}/config:latest" AS config

FROM quay.io/fedora/fedora-bootc:$FEDORA_VERSION

COPY build_files/*.sh /tmp
COPY sys_files /

RUN --mount=type=bind,from=config,src=/rpms,dst=/tmp/rpms/config \
    mkdir -p /var/lib/alternatives && \
    /tmp/build.sh && \
    dnf clean all && \
    bootc container lint
