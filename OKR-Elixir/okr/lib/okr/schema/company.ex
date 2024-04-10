defmodule Okr.Schema.Company do
  use Ecto.Schema
  import Ecto.Changeset
  @primary_key {:company_id, :binary, autogenerate: false}
  schema "company" do
    field(:tenant_id, :binary)
    field(:name, :string)
    has_many(:employee_id, Okr.Schema.Employee)

  end

  def changeset(company,attrs) do
    company
    |>cast(attrs,[:company_id, :tenant_id, :name])
    |>validate_required([:company_id, :tenant_id, :name])
    |>unique_constraint(:tenant_id)
  end

end
