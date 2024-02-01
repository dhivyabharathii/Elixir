defmodule Todo.KeyResult do
  use Ecto.Schema
  import Ecto.Changeset

  schema "key_results" do
    field :description, :string
    field :status, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(key_result, attrs) do
    key_result
    |> cast(attrs, [:description, :status])
    |> validate_required([:description, :status])
  end
end
