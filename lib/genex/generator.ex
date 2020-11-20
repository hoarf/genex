defmodule Genex.Generator do
  def router(bindings) do
    dir = Application.app_dir(:genex, ["priv", "templates", "router.eex"])
    EEx.eval_file(dir, bindings)
  end

  def controller(bindings) do
    dir = Application.app_dir(:genex, ["priv", "templates", "controller.eex"])
    EEx.eval_file(dir, bindings)
  end

  def schema(bindings) do
    dir = Application.app_dir(:genex, ["priv", "templates", "schema.eex"])
    EEx.eval_file(dir, bindings)
  end
end
