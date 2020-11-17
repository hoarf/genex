defmodule Genex.Spec do
  defstruct [:domains]

  def decode(json) do
    with {:ok, decoded} <- Jason.decode(json) do
      build(decoded)
    end
  end

  def build(decoded) do
    %__MODULE__{domains: Enum.map(decoded["domains"], &Genex.Domain.build/1)}
  end
end

defmodule Genex.Domain do
  defstruct [:name, :description, :resources]

  def build(decoded) do
    %__MODULE__{
      name: decoded["name"],
      description: decoded["description"],
      resources: Enum.map(decoded["resources"], &Genex.Resource.build/1)
    }
  end
end

defmodule Genex.Resource do
  defstruct [:name, :fields, :methods]

  def build(decoded) do
    %__MODULE__{
      name: decoded["name"],
      methods: decoded["methods"],
      fields: Enum.map(decoded["fields"], &Genex.Field.build/1)
    }
  end
end

defmodule Genex.Field do
  defstruct [:name, :type]

  def build(decoded) do
    %__MODULE__{
      name: decoded["name"],
      type: decoded["type"]
    }
  end
end
