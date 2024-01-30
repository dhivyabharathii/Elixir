defmodule RecipeOrganizer.Repo do
  use Ecto.Repo,
    otp_app: :recipe_organizer,
    adapter: Ecto.Adapters.Postgres
end
