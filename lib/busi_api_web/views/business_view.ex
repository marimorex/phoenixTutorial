defmodule BusiApiWeb.BusinessView do
  use BusiApiWeb, :view
  alias BusiApiWeb.BusinessView
  alias BusiApiWeb.ColaboratorView

  def render("index.json", %{businesses: businesses}) do
    %{data: render_many(businesses, BusinessView, "business.json")}
  end

  def render("show.json", %{business: business}) do
    %{data: render_one(business, BusinessView, "business.json")}
  end

  def render("business.json", %{business: business}) do
    %{
      id: business.id,
      name: business.name,
      description: business.description,
      tag: business.tag,
      date: NaiveDateTime.to_string(business.inserted_at),
      year: business.year,
      collaborators:
      %{
        data: render_many(business.colaborators, ColaboratorView, "colaborator.json")
       }
    }
  end
end
