# Genex

Generate phoenix files based on specification.

Features

- [x] Generate route files
- [x] Generate controller files
- [x] Generate schema files
  - [ ] Support associations
- [ ] Generate view files

# Example

```sh
mix gen spec.json
```

Router:

```elixir
defmodule App.Router do
  use App, :router

  pipeline :api do
    plug :accepts, ["json"]
  end


  scope "/hr", App do
    pipe_through :api
  
    resources /users, UserController, only: [:get, :post]
  
  end

end
```

Schema: 

```elixir
defmodule App.Employee do
  use Ecto.Schema
  import Ecto.Changeset

  schema "employee" do
  
    field :name, :string
  
    timestamps()
  end
end
```

Controller:

```elixir
defmodule AppWeb.EmployeeController do
  use AppWeb, :controller

  action_fallback AppWeb.FallbackController

  alias App.Hr
  alias App.Employee


  def index(conn, _params) do
    employees = Hr.list_employees()
    render(conn, "index.json", employees: employees)
  end

  def show(conn, %{"id" => id}) do
    employee = Hr.get_employee!(id)
    render(conn, "show.json", employee: employee)
  end


 def create(conn, %{employee => employee_params}) do
    with {:ok, %Employee{} = employee} <- Hr.create_employee(employee_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.Helper.employee_path(conn, :show, employee))
      |> render("show.json", employee: employee)
    end
  end


  def update(conn, %{"id" => id, employee => employee_params}) do
    employee = Hr.get_employee!(id)

    with {:ok, %Employee{} = employee} <- Hr.update_employee(employee, employee_params) do
      render(conn, "show.json", employee: employee)
    end
  end


  def delete(conn, %{"id" => id}) do
    employee = Hr.get_employee!(id)

    with {:ok, %Employee{}} <- Hr.delete_employee(employee) do
      send_resp(conn, :no_content, "")
    end
  end

end
```

# Domain Specification

A domain specification is a JSON file. Exemple of a simple JSON spec.

```json
{
  "domains": [
    {
      "description": "The Human Resources domain",
      "resources": [
        {
          "name": "employee",
          "fields": [
            {
              "type": ":string",
              "name": "name"
            }
          ],
          "methods": [
            ":get",
            ":post",
            ":index",
            ":put",
            ":delete"
          ]
        }
      ],
      "name": "hr"
    }
  ]
}
```


## Installation

```elixir
def deps do
  [
    {:genex, "~> 0.1.0"}
  ]
end
```

