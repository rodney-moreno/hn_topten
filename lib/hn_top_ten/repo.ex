defmodule HnTopTen.Repo do
  use Ecto.Repo,
    otp_app: :hn_top_ten,
    adapter: Ecto.Adapters.Postgres
end
