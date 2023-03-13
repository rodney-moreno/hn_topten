defmodule HnTopTenWeb.PageController do
  use HnTopTenWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
