from fastmcp import FastMCP
from fastmcp.client.transports import StreamableHttpTransport
from pydantic import HttpUrl
from pydantic_settings import BaseSettings


class Settings(BaseSettings):
    server_address: HttpUrl


settings = Settings()  # type: ignore

mcp = FastMCP.as_proxy(
    StreamableHttpTransport(str(settings.server_address) + "mcp/"),
    name="stdio-proxy",
)
