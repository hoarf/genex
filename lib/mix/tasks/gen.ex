defmodule Mix.Tasks.Gen do
  use Mix.Task

  @impl Mix.Task
  def run(args) do
    args
    |> Enum.join("")
    |> File.read!()
    |> Genex.Spec.decode()
    |> router()
    |> controllers()
  end

  defp router(spec) do
    spec
    |> Genex.Bindings.router()
    |> Genex.Generator.router()
    |> IO.puts()

    spec
  end

  defp controllers(spec) do
    for domain <- spec.domains, resource <- domain.resources do
      resource
      |> Genex.Bindings.controller(domain)
      |> Genex.Generator.controller()
      |> IO.puts()
    end

    spec
  end
end
