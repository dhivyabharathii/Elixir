defmodule Okr.Repo.Migrations.AddEmployee do
  use Ecto.Migration

  def change do
    create table(:employee, primary_key: false) do
      add(:employee_id,:uuid,primary_key: true)
      add(:manager_id,:uuid)
      add(:first_name,:string)
      add(:last_name,:string)
      add(:email,:string)
      add(:role,:string)
      add(:location,:string)
      add(:designation,:string)
      add(:experience,:string)
      add(:skill_set,:string)
      add(:company_id, references(:company,column: :company_id, on_delete: :delete_all, type: :uuid), null: false)
      add(:is_admin, :boolean)
      add(:is_archived, :boolean)
    end

    create(unique_index(:employee, [:employee_id]))
    create(unique_index(:employee, [:email]))
  end
end
