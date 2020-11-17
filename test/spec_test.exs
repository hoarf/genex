defmodule GenexTest.Spec do
  use ExUnit.Case

  setup do
    json = ~S"""
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
    """

    {:ok, json: json}
  end

  test "decode/1", ctx do
    assert match?({:ok, %Genex.Spec{}}, Genex.Spec.decode(ctx.json))
  end
end
