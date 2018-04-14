defmodule TransitTracker.Repo.Migrations.CreatePredictions do
  use Ecto.Migration

  def change do
    create table(:predictions) do
      add :prediction_id, :string
      add :arrival_time, :string
      add :departure_time, :string
      add :of_vehicle, references(:vehicles, on_delete: :delete_all)
      add :of_route, references(:routes, on_delete: :delete_all)
      add :of_stop, references(:stops, on_delete: :delete_all)

      timestamps()
    end

  end
end
