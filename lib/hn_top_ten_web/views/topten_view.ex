defmodule HnTopTenWeb.TopTenView do
  use HnTopTenWeb, :view

  def get_max_id() do
    case HTTPoison.get("https://hacker-news.firebaseio.com/v0/maxitem") do
      {:ok, %HTTPPoison.Response{status_code: 200, body: body}} ->
	body
    end
  end

  def find_weekly_posts() do
    case HTTPoison.get("https://hacker-news.firebaseio.com/v0/maxitem") do
      {:ok, %HTTPPoison.Response{status_code: 200, body: body}} ->
	body
    end
  end

  def get_posts() do
    {:ok, %HTTPPoison.Response{status_code: 200, body: max_item_id}} = HTTPoison.get("https://hacker-news.firebaseio.com/v0/maxitem")

    {:ok, min_item_id} = search()

    
    


  end
end
