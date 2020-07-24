defmodule BusiApi.Directory.Business do
  use Ecto.Schema
  import Ecto.Changeset

  schema "businesses" do
    field :description, :string
    field :name,        :string
    field :tag,         :string
    field :year,        :integer
    has_many :colaborators, BusiApi.Directory.Colaborator
    timestamps()
  end

  @spec changeset(
          {map, map} | %{:__struct__ => atom | %{__changeset__: map}, optional(atom) => any},
          :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}
        ) :: Ecto.Changeset.t()
  @doc false
  def changeset(business, attrs) do
    business
    |> cast(attrs, [:name, :description, :tag])
    |> validate_required([:name, :description, :tag])
  end
end
