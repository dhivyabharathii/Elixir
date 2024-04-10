defmodule OkrWeb.CompanyController do
  use OkrWeb, :controller
  alias Okr.Schema
  alias Ecto.UUID

  def add_company(name) do
    Schema.create_company(%{company_id: UUID.bingenerate(), tenant_id: UUID.bingenerate(), name: name })
  end
end
