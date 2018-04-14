defmodule TransitTracker.Repo.Migrations.CreateStops do
  use Ecto.Migration

  def change do
    create table(:stops) do
      add :stop_id, :string
      add :of_route, references(:routes, on_delete: :delete_all)

      timestamps()
    end

  end
end
