defmodule TransitTracker.Repo.Migrations.CreateStops do
  use Ecto.Migration

  def change do
    create table(:stops) do
      add :name, :string
      add :stop_id, :string
      add :lat, :float
      add :long, :float
      add :routes, {:array, :string}

      timestamps()
    end

  end
end
