defmodule BusiApi.Repo.Migrations.AddYearToBusinesses do
  use Ecto.Migration

  def change do
    alter table(:businesses) do
      add :year, :integer
    end
  end
end
