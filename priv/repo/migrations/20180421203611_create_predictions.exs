defmodule TransitTracker.Repo.Migrations.CreatePredictions do
  use Ecto.Migration

  def change do
    create table(:predictions) do
      add :vehicle_mbta_id, :string
      add :stop_mbta_id, :string
      add :route_mbta_id, :string
      add :arrival_time, :utc_datetime
      add :direction, :integer
      add :vehicle_int_id, references(:vehicles, on_delete: :delete_all)
      add :stop_int_id, references(:stops, on_delete: :delete_all)
      add :route_int_id, references(:routes, on_delete: :delete_all)

      timestamps()
    end

    create index(:predictions, [:vehicle_int_id])
    create index(:predictions, [:stop_int_id])
    create index(:predictions, [:route_int_id])
  end
end
