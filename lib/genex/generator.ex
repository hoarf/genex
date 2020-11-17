defmodule Genex.Generator do
  def router(bindings) do
    dir = Application.app_dir(:genex, ["priv", "templates", "router.eex"])
    EEx.eval_file(dir, bindings)
  end
end
