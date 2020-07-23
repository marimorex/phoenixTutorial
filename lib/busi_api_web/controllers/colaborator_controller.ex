defmodule BusiApiWeb.ColaboratorController do
    use BusiApiWeb, :controller
    alias BusiApi.Directory
    alias BusiApi.Directory.Colaborator

    action_fallback BusiApiWeb.FallbackController

    def get_businesess_collaborators(conn, %{"id" => id, "year" => year}) do
      colaborators = Directory.get_businesess_collaborators(id, year)
      render(conn, "index.json", colaborators: colaborators)
    end
  end
