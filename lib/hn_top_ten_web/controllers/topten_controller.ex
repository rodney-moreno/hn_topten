defmodule HnTopTenWeb.TopTenController do
  use HnTopTenWeb, :controller

  alias HnTopTenWeb.TopTenView
  
  def topten(conn, _params) do
    render(conn, "top_ten.html")
  end
  
end
