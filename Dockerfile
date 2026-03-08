FROM python:3.9-slim

WORKDIR /app

COPY requirements_FINAL.txt requirements.txt

RUN pip install --no-cache-dir -r requirements.txt

COPY bot.py .

CMD ["python", "bot.py"]
