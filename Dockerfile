FROM python:3.8.10-slim

RUN apt-get update && apt-get install -y \
    libpq-dev gcc python3-dev netcat

WORKDIR /app

COPY . /app

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN pip install --upgrade pip && \
    pip install -r requirements.txt && \
    sed -i 's/\r$//g' /app/entrypoint.sh && \
    chmod +x /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]