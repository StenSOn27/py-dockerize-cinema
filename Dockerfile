FROM python:3.12-slim
LABEL maintainer="tarashevchik27@gmail.com"

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

RUN adduser \
        --disabled-password \
        --no-create-home \
        django-user

RUN mkdir -p /app/media /app/static && \
    chown -R django-user:django-user /app && \
    chmod -R 755 /app/media /app/static

COPY . .