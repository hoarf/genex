defmodule Genex.Bindings do
  def router(spec) do
    [domains: spec.domains, web_namespace: "AppWeb"]
  end

  def controller(resource, domain) do
    [
      methods: resource.methods,
      schema: String.capitalize(resource.name),
      context: String.capitalize(domain.name),
      plural: "#{resource.name}s",
      singular: resource.name,
      web_namespace: "AppWeb"
    ]
  end
end
