defmodule HnTopTen.BinarySearch do
  def search(left, right, time) do
    id = left + right / 2

    prev_time = get_post_time(id, time)

    if prev_time <= time do
      id
    else
      search(left, id, time)
    end    
  end

  def call_api(id) do
    case HTTPoison.get("https://hacker-news.firebaseio.com/v0/id/#{id}") do
      {:ok, %HTTPoisonResponse{status_code: 200, body: body}} -> {:ok, body}
      {:error, HTTPoisonError} -> {:error, HTTPoisonError}
    end
  end

  def get_post_time(id, time) do
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
      time = System.os_time(:second) - 604800
      Io.puts HnTopTen.BinarySearch.search(0, 35137198, time)
    end
  end

  
