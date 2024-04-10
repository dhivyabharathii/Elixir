defmodule Okr.Schema do
  import Ecto.Query, warn: false
  alias Ecto.UUID
  alias Okr.Schema.Company
  alias Okr.Schema.Employee
  alias Okr.Repo


  def create_company(attrs \\ %{}) do
    %Company{}
    |> Company.changeset(attrs)
    |> Repo.insert()
  end

  def get_company(name), do: Repo.get_by(Company, name: name)

  def create_employee(attrs \\ %{}) do
    %Employee{}
    |> Employee.changeset(attrs)
    |> Repo.insert()
  end
end
