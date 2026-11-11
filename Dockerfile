FROM python:3.12.16-slim-bookworm

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . /app

RUN chmod +x /app/entrypoint.sh

EXPOSE 8020

ENTRYPOINT ["/app/entrypoint.sh"]
