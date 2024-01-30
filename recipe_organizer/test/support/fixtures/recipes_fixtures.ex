defmodule RecipeOrganizer.RecipesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `RecipeOrganizer.Recipes` context.
  """

  @doc """
  Generate a recipe.
  """
  def recipe_fixture(attrs \\ %{}) do
    {:ok, recipe} =
      attrs
      |> Enum.into(%{
        cook_time: 42,
        ingredients: "some ingredients",
        instructions: "some instructions",
        prep_time: 42,
        title: "some title"
      })
      |> RecipeOrganizer.Recipes.create_recipe()

    recipe
  end
end
