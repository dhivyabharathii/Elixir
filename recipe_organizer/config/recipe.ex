defmodule RecipeOrganizer.Recipes.Recipe do
  use Ecto.Schema
  import Ecto.Changeset

  schema "recipes" do
    field :title, :string
    field :ingredients, {:array, :string}
    field :instructions, :string
    field :prep_time, :integer
    field :cook_time, :integer

    timestamps()
  end

  @doc false
  def changeset(recipe, attrs) do
    recipe
    |> cast(attrs, [:title, :ingredients, :instructions, :prep_time, :cook_time])
    |> validate_required([:title, :ingredients, :instructions, :prep_time, :cook_time])
  end
end
