defmodule RecipeOrganizer.Repo.Migrations.CreateRecipes do
  use Ecto.Migration

  def change do
    create table(:recipes) do
      add :title, :string
      add :ingredients, :string
      add :instructions, :string
      add :prep_time, :integer
      add :cook_time, :integer

      timestamps()
    end
  end
end
