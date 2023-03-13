defmodule HnTopTenWeb.TopTenController do
  use HnTopTenWeb, :controller

  alias HnTopTenWeb.TopTenView
  
  def top_ten(conn, _params) do
    posts = TopTenView.get_posts()
    render(conn, "top_ten.html", posts)
  end
  
end
