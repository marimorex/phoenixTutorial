defmodule BusiApiWeb.ColaboratorView do
    use BusiApiWeb, :view
    alias BusiApiWeb.ColaboratorView

    def render("index.json", %{colaborators: colaborators}) do
      %{data: render_many(colaborators, ColaboratorView, "colaborator.json")}
    end

    def render("show.json", %{colaborator: colaborator}) do
      %{data: render_one(colaborator, ColaboratorView, "colaborator.json")}
    end

    def render("colaborator.json", %{colaborator: colaborator}) do
      %{
        id: colaborator.id,
        name: colaborator.name,
        lastname: colaborator.lastname,
        email: colaborator.email
      }
    end
  end