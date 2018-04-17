defmodule TransitTracker.Repo.Migrations.Stops do
  use Ecto.Migration

  def change do
    alter table(:stops) do
      add :children, {:array, :string}
  end
end
