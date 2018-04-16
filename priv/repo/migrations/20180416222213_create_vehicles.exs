defmodule TransitTracker.Repo.Migrations.CreateVehicles do
  use Ecto.Migration

  def change do
    create table(:vehicles) do
      add :mbta_id, :string
      add :lat, :float
      add :long, :float
      add :current_status, :string
      add :next_stop_eta, :utc_datetime
      add :direction, :integer
      add :route_id, references(:routes, on_delete: :delete_all)
      add :next_stop_id, references(:stops, on_delete: :delete_all)

      timestamps()
    end

    create index(:vehicles, [:route_id])
    create index(:vehicles, [:next_stop_id])
  end
end
