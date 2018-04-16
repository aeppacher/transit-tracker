defmodule TransitTracker.Transit.Vehicle do
  use Ecto.Schema
  import Ecto.Changeset


  schema "vehicles" do
    field :current_status, :string
    field :direction, :integer
    field :lat, :float
    field :long, :float
    field :mbta_id, :string
    field :next_stop_eta, :utc_datetime
    field :route_id, :id
    field :next_stop_id, :id

    timestamps()
  end

  @doc false
  def changeset(vehicle, attrs) do
    vehicle
    |> cast(attrs, [:mbta_id, :lat, :long, :current_status, :next_stop_eta, :direction])
    |> validate_required([:mbta_id, :lat, :long, :current_status, :next_stop_eta, :direction])
  end
end
