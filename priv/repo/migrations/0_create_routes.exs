defmodule TransitTracker.Repo.Migrations.CreateRoutes do
  use Ecto.Migration

  def change do
    create table(:routes) do
      add :name, :string
      add :route_id, :integer
      add :directions_names, {:array, :string}

      timestamps()
    end
  end
end
