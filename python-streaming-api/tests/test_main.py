from fastapi.testclient import TestClient

from app.main import app

client = TestClient(app)


def test_health() -> None:
    response = client.get("/health")
    assert response.status_code == 200
    assert response.json() == {"status": "ok"}


def test_stream_returns_sse_tokens_and_done_event() -> None:
    response = client.get("/stream", params={"message": "Hello World", "delay": 0})

    assert response.status_code == 200
    assert response.headers["content-type"].startswith("text/event-stream")
    assert '"token": "Hello"' in response.text
    assert '"token": "World"' in response.text
    assert "event: done" in response.text
    assert '"done": true' in response.text


def test_delay_validation() -> None:
    response = client.get("/stream", params={"delay": 3})
    assert response.status_code == 422
