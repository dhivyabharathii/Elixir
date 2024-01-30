defmodule RecipeOrganizer.Recipes.Recipe do
  use Ecto.Schema
  import Ecto.Changeset

  schema "recipes" do
    field :cook_time, :integer
    field :ingredients, :string
    field :instructions, :string
    field :prep_time, :integer
    field :title, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(recipe, attrs) do
    recipe
    |> cast(attrs, [:title, :ingredients, :instructions, :prep_time, :cook_time])
    |> validate_required([:title, :ingredients, :instructions, :prep_time, :cook_time])
  end
end
