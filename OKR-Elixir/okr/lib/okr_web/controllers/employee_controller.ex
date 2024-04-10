defmodule OkrWeb.EmployeeController do
  use OkrWeb, :controller
  alias Okr.Schema
  alias Ecto.UUID

  def add_employee(employee) do
    Schema.create_employee(%{employee_id: UUID.bingenerate(),
    email: employee.email,
    first_name: employee.first_name,
    last_name: employee.last_name,
    is_admin: employee.is_admin,
    role: employee.role,
    location: employee.location,
    is_archieved: employee.is_archieved,
    designation: employee.designation,
    experience: employee.experience,
    skill_set: employee.skill_set,
    company_id: UUID.dump!(employee.company_id)
    })
  end
end
# employee =%{employee_id: Ecto.UUID.bingenerate(),
# email: "emp1@gmail.com",
# first_name: "Dhivya",
# last_name: "Bharathi",
# is_admin: true,
# location: "chennai",
# is_archieved: true,
# designation: "Eng",
# experience: "2",
# role: "Eng",
# skill_set: " Elixir",
# company_id: "0f1eb780-727b-4210-9a7a-8404281fcbfc"
# }
