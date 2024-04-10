defmodule Okr.Repo.Migrations.CreateCompany do
  use Ecto.Migration

  def change do
    create table(:company, primary_key: false) do
      add(:company_id,:uuid,primary_key: true)
      add(:tenant_id,:uuid)
      add(:name,:string)
    end

    create(unique_index(:company, [:company_id]))
    create(unique_index(:company, [:tenant_id]))
    create(unique_index(:company, [:name]))

  end
end
