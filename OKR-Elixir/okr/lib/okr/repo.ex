defmodule Okr.Repo do
  use Ecto.Repo,
    otp_app: :okr,
    adapter: Ecto.Adapters.Postgres
end
