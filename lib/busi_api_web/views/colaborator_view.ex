defmodule BusiApiWeb.ColaboratorView do
    use BusiApiWeb, :view
    alias BusiApiWeb.ColaboratorView

    def render("index.json", %{colaborators: colaborators}) do
      %{data: render_many(colaborators, ColaboratorView, "colaborator_assoc.json")}
    end

    def render("show.json", %{colaborator: colaborator}) do
      %{data: render_one(colaborator, ColaboratorView, "colaborator_assoc.json")}
    end

    def render("colaborator_assoc.json", %{colaborator: colaborator}) do
      %{
        id: colaborator.id,
        name: colaborator.name,
        lastname: colaborator.lastname,
        email: colaborator.email,
        business:
        %{
          id: colaborator.business.id,
          name: colaborator.business.name,
          description: colaborator.business.description,
          tag: colaborator.business.tag,
          year: colaborator.business.year
        }
      }
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