defmodule TransitTracker.Repo.Migrations.CreateTrips do
  use Ecto.Migration

  def change do
    create table(:trips) do
      add :trip_id, :integer
      add :of_route, references(:routes, on_delete: :delete_all)
      add :prediction_list, references(:predictions, on_delete: :delete_all)
      add :of_vehicle, references(:vehicles, on_delete: :delete_all)

      timestamps()
    end

  end
end
