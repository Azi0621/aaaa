# FastAPI Streaming API Demo

This project demonstrates a streaming HTTP API with FastAPI using
Server-Sent Events (SSE). The endpoint emits one JSON event per word and a
final completion event. It also stops generation if the client disconnects.

## Run

```bash
python -m venv .venv
python -m pip install -r requirements.txt
uvicorn app.main:app --reload
```

Open a streaming request:

```bash
curl -N "http://127.0.0.1:8000/stream?message=Hello%20FastAPI&delay=0.2"
```

Example response:

```text
event: token
data: {"index": 1, "token": "Hello", "done": false}

event: token
data: {"index": 2, "token": "FastAPI", "done": false}

event: done
data: {"done": true}
```

Interactive documentation is available at `http://127.0.0.1:8000/docs`.

## Test

```bash
pytest -q
```
