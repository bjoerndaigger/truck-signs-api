FROM python:3.12.16-slim-bookworm

WORKDIR /app

# Install netcat (nc) to check if the database is ready in entrypoint.sh
RUN apt-get update && apt-get install -y netcat-openbsd

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . /app

RUN chmod +x /app/entrypoint.sh

WORKDIR /app/src

EXPOSE 8020

ENTRYPOINT ["/app/entrypoint.sh"]
