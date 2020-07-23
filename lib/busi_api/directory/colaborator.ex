defmodule BusiApi.Directory.Colaborator do
  use Ecto.Schema
  import Ecto.Changeset

  schema "colaborators" do
    field :email, :string
    field :lastname, :string
    field :name, :string
    belongs_to :business,  BusiApi.Directory.Business
    timestamps()
  end

  @doc false
  def changeset(colaborator, attrs) do
    colaborator
    |> cast(attrs, [:name, :lastname, :email])
    |> validate_required([:name, :lastname, :email])
  end
end
