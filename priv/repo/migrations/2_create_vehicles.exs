defmodule TransitTracker.Repo.Migrations.CreateVehicles do
  use Ecto.Migration

  def change do
    create table(:vehicles) do
      add :current_status, :string
      add :vehicle_id, :integer

      timestamps()
    end

  end
end
