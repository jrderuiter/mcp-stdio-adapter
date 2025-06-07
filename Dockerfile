FROM python:3.12-slim-bookworm
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

COPY --from=ghcr.io/github/github-mcp-server /server/github-mcp-server /bin/

# Copy the project into the image
COPY main.py pyproject.toml uv.lock /app/

# Sync the project into a new environment, asserting the lockfile is up to date
WORKDIR /app
RUN uv sync --locked

CMD ["uv", "run", "fastmcp", "run", "main.py"]
