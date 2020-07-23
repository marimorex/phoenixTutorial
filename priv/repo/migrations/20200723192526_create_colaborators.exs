defmodule BusiApi.Repo.Migrations.CreateColaborators do
  use Ecto.Migration

  def change do
    create table(:colaborators) do
      add :name, :string
      add :lastname, :string
      add :email, :string
      add :business_id, references(:businesses)
      timestamps()
    end

  end
end
