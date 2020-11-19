# Genex

Generate phoenix files based on specification.

Features

- [x] Generate route files
- [x] Generate controller files
- [ ] Generate schema files
- [ ] Generate view files

# Example

```sh
mix gen spec.json
```

Router:

```
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

# Domain Specification

A domain specification is a JSON file. Exemple of a simple JSON spec.

```json
{
    "domains": [
        {
            "name": "HR",
            "description": "The Human Resources domain",
            "resources": [
                {
                    "name": "users",
                    "methods": [
                        ":get",
                        ":post"
                    ],
                    "fields": [
                        {
                            "name": "username",
                            "type": "string"
                        }
                    ]
                }
            ]
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

