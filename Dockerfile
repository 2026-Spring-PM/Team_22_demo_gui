FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /workspace

RUN apt-get update && apt-get install -y --no-install-recommends \
    libsfml-dev \
    xvfb \
    openbox \
    x11vnc \
    novnc \
    websockify \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 6080 5900

CMD ["bash", "/workspace/scripts/docker_start.sh"]
