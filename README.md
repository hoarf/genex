# Genex

Generates route files based on a domain driven spec.

# Domain Specification

A domain specification is a JSON file. Exemple of a simple JSON spec.

```json
{
    "domains": [
        {
            "name": "HR",
            "resources": [
                {
                    "methods": [
                        "get",
                        "post"
                    ],
                    "fields": [
                        {
                            "name": "username",
                            "type": "string"
                        }
                    ],
                    "name": "users"
                }
            ],
            "description": "The Human Resources domain"
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

