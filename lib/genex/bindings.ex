defmodule Genex.Bindings do
  def router(spec) do
    [domains: spec.domains, web_namespace: "App"]
  end
end
