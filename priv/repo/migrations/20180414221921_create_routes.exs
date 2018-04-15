defmodule TransitTracker.Repo.Migrations.CreateRoutes do
  use Ecto.Migration

  def change do
    create table(:routes) do
      add :name, :string
      add :route_id, :string
      add :dir_0, :string
      add :dir_1, :string

      timestamps()
    end

  end
end
