defmodule Okr.Schema.Employee do
  use Ecto.Schema
  import Ecto.Changeset
  @primary_key {:employee_id, :binary, autogenerate: false}
  schema "employee" do
    field(:email, :string)
    field(:first_name, :string)
    field(:last_name, :string)
    field(:role, :string)
    field(:is_admin, :boolean)
    field(:location, :string)
    field(:is_archived, :boolean)
    belongs_to(:company, Okr.Schema.Company, references: :company_id, type: :binary)
    field(:designation, :string)
    field(:experience, :string)
    field(:skill_set, :string)
  end

  def changeset(employee,attrs) do
    employee
    |>cast(attrs,[:employee_id, :email, :first_name, :last_name, :is_admin,:company_id,:role,:location,:is_archived,:designation,:experience,:skill_set])
    |>validate_required([:employee_id, :email, :first_name, :last_name, :is_admin,:company_id ])
  end
end
    # belongs_to(:manager_id, Okr.Schema.Manager)
    # belongs_to(:functional_manager_id, Okr.Schema.Manager)
    # belongs_to(:designation_manager_id, Okr.Schema.Manager)
