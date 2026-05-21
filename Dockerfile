FROM python:3.13.0-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    libxml2-dev \
    libxslt1-dev \
    python3-dev \
    libjpeg-dev \
    zlib1g-dev \
    libffi-dev \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

COPY . ./

RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -e . sqlalchemy aiosqlite newspaper4k lxml_html_clean
RUN playwright install --with-deps chromium

CMD ["python", "-m", "news_room_bot"]                               