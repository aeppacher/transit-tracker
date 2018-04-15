defmodule TransitTracker.Transit.Route do
  use Ecto.Schema
  import Ecto.Changeset


  schema "routes" do
    field :dir_0, :string
    field :dir_1, :string
    field :name, :string
    field :route_id, :string

    timestamps()
  end

  @doc false
  def changeset(route, attrs) do
    route
    |> cast(attrs, [:name, :route_id, :dir_0, :dir_1])
    |> validate_required([:name, :route_id, :dir_0, :dir_1])
  end
end
