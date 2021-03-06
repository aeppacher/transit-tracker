defmodule TransitTracker.Transit.Stop do
  use Ecto.Schema
  import Ecto.Changeset


  schema "stops" do
    field :lat, :float
    field :long, :float
    field :name, :string
    field :stop_id, :string
    field :routes, {:array, :string}
    field :children, {:array, :string}

    timestamps()
  end

  @doc false
  def changeset(stop, attrs) do
    stop
    |> cast(attrs, [:name, :stop_id, :lat, :long, :routes, :children])
    |> validate_required([:name, :stop_id, :lat, :long, :routes, :children])
  end
end
