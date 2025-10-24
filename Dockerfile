FROM python:3.11-slim
WORKDIR /app
RUN pip install fastapi uvicorn
COPY app/ ./app
EXPOSE 8080
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]

