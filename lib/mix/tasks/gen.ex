defmodule Mix.Tasks.Gen do
  use Mix.Task

  @impl Mix.Task
  def run(args) do
    args
    |> Enum.join("")
    |> File.read!()
    |> Genex.Spec.decode()
    |> Genex.Bindings.router()
    |> Genex.Generator.router()
    |> IO.puts()
  end
end
