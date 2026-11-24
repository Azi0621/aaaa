import asyncio
import json
from collections.abc import AsyncIterator

from fastapi import FastAPI, Query, Request
from fastapi.responses import StreamingResponse

app = FastAPI(title="FastAPI Streaming Demo", version="1.0.0")


async def event_stream(message: str, delay: float) -> AsyncIterator[str]:
    """Yield one standards-compliant Server-Sent Event per word."""
    words = message.split()
    for index, word in enumerate(words, start=1):
        payload = {"index": index, "token": word, "done": False}
        yield f"event: token\ndata: {json.dumps(payload, ensure_ascii=False)}\n\n"
        await asyncio.sleep(delay)

    yield f"event: done\ndata: {json.dumps({'done': True})}\n\n"


@app.get("/health")
async def health() -> dict[str, str]:
    return {"status": "ok"}


@app.get("/stream")
async def stream(
    request: Request,
    message: str = Query("Hello from a FastAPI streaming endpoint"),
    delay: float = Query(0.1, ge=0, le=2),
) -> StreamingResponse:
    async def disconnect_aware_stream() -> AsyncIterator[str]:
        async for event in event_stream(message, delay):
            if await request.is_disconnected():
                break
            yield event

    return StreamingResponse(
        disconnect_aware_stream(),
        media_type="text/event-stream",
        headers={
            "Cache-Control": "no-cache",
            "X-Accel-Buffering": "no",
        },
    )
