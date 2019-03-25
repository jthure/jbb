defmodule JBB.Repo do
  use Ecto.Repo,
    otp_app: :jbb,
    adapter: Ecto.Adapters.Postgres
end
