FROM python:3.11-slim
WORKDIR /app

RUN apt-get update && apt-get install -y \
    openssh-client \
    rsync \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir aiohttp

COPY server .

# TOKEN is set as env variable in Render dashboard
# PORT is set automatically by Render
CMD ["python3", "server"]
