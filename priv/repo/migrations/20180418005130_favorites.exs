defmodule TransitTracker.Repo.Migrations.Favorites do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :favorites, {:array, :string}, default: []
    end
  end
end
