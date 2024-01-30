defmodule RecipeOrganizer.RecipesTest do
  use RecipeOrganizer.DataCase

  alias RecipeOrganizer.Recipes

  describe "recipes" do
    alias RecipeOrganizer.Recipes.Recipe

    import RecipeOrganizer.RecipesFixtures

    @invalid_attrs %{cook_time: nil, ingredients: nil, instructions: nil, prep_time: nil, title: nil}

    test "list_recipes/0 returns all recipes" do
      recipe = recipe_fixture()
      assert Recipes.list_recipes() == [recipe]
    end

    test "get_recipe!/1 returns the recipe with given id" do
      recipe = recipe_fixture()
      assert Recipes.get_recipe!(recipe.id) == recipe
    end

    test "create_recipe/1 with valid data creates a recipe" do
      valid_attrs = %{cook_time: 42, ingredients: "some ingredients", instructions: "some instructions", prep_time: 42, title: "some title"}

      assert {:ok, %Recipe{} = recipe} = Recipes.create_recipe(valid_attrs)
      assert recipe.cook_time == 42
      assert recipe.ingredients == "some ingredients"
      assert recipe.instructions == "some instructions"
      assert recipe.prep_time == 42
      assert recipe.title == "some title"
    end

    test "create_recipe/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Recipes.create_recipe(@invalid_attrs)
    end

    test "update_recipe/2 with valid data updates the recipe" do
      recipe = recipe_fixture()
      update_attrs = %{cook_time: 43, ingredients: "some updated ingredients", instructions: "some updated instructions", prep_time: 43, title: "some updated title"}

      assert {:ok, %Recipe{} = recipe} = Recipes.update_recipe(recipe, update_attrs)
      assert recipe.cook_time == 43
      assert recipe.ingredients == "some updated ingredients"
      assert recipe.instructions == "some updated instructions"
      assert recipe.prep_time == 43
      assert recipe.title == "some updated title"
    end

    test "update_recipe/2 with invalid data returns error changeset" do
      recipe = recipe_fixture()
      assert {:error, %Ecto.Changeset{}} = Recipes.update_recipe(recipe, @invalid_attrs)
      assert recipe == Recipes.get_recipe!(recipe.id)
    end

    test "delete_recipe/1 deletes the recipe" do
      recipe = recipe_fixture()
      assert {:ok, %Recipe{}} = Recipes.delete_recipe(recipe)
      assert_raise Ecto.NoResultsError, fn -> Recipes.get_recipe!(recipe.id) end
    end

    test "change_recipe/1 returns a recipe changeset" do
      recipe = recipe_fixture()
      assert %Ecto.Changeset{} = Recipes.change_recipe(recipe)
    end
  end
end
