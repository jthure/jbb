defmodule JBBWeb.PageController do
  use JBBWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
