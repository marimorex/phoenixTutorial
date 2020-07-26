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

  def changeset(business, attrs) do
    business
    |> cast(attrs, [:name, :description, :tag, :year])
    |> validate_required([:name, :description, :tag, :year])
  end
end
