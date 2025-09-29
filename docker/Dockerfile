FROM python:3.12-slim
WORKDIR /app
COPY app/equirements.txt .
RUN pip install --no-cache-dir -r equirements.txt
COPY app/ ./
EXPOSE 8000
CMD ["python","-m","uvicorn","main:app","--host","0.0.0.0","--port","8000"]
