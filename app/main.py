from fastapi import FastAPI
from fastapi.responses import PlainTextResponse
import os

app = FastAPI()

@app.get("/health")
def health():
    return {"ok": True}

@app.get("/secret")
def secret():
    # Vault CSI mounts file at this path (see Helm template)
    path = os.environ.get("SECRET_PATH", "/vault/secrets/api_key")
    try:
        with open(path) as f:
            return {"secret": f.read().strip()}
    except Exception as e:
        return {"error": str(e)}

@app.get("/metrics", response_class=PlainTextResponse)
def metrics():
    # Minimal sample metric; replace with real metrics in production
    return "hello_requests_total 1\n"
