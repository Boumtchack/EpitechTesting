defmodule Backendpheonix.Repo do
  use Ecto.Repo,
    otp_app: :backendpheonix,
    adapter: Ecto.Adapters.Postgres
end
