defmodule HnTopTen.BinarySearch do
  def search(left, right, time) do
    id = trunc(left + right / 2)

    prev_time = get_post_time(id)

    if prev_time <= time do
      id
    else
      search(left, id, time)
    end    
  end

  def call_api(id) do
    case HTTPoison.get("https://hacker-news.firebaseio.com/v0/item/#{id}.json?print=pretty") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} -> {:ok, body}
      {:error, _HTTPoisonError} -> {:error, HTTPoisonError}
    end
  end

  def get_post_time(id) do
    # attempt 3
    with {:ok, response} <- call_api(id),
	 {:ok, decoded} <- Jason.decode(response) do
      
      {:ok, decoded.time}
    end
  end

    # attempt 1
    # response = HTTPoison.get!("https://hacker-news.firebaseio.com/v0/id/#{id}")
    # response_map = Jason.decode!(response.body)
    # response_map.time

    # attempt 2
    # HTTPoison.get("https://hacker-news.firebaseio.com/v0/id/#{id}")
    # |> Map.get("body")
    # |> Jason.decode
    # |> Map.get("time")
    # end

    def main() do
      time = trunc(System.os_time(:second) - 604800)
      IO.puts HnTopTen.BinarySearch.search(0, 35161067, time)
    end
  end

  
