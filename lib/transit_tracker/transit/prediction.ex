defmodule TransitTracker.Transit.Prediction do
  use Ecto.Schema
  import Ecto.Changeset


  schema "predictions" do
    field :arrival_time, :utc_datetime
    field :direction, :integer
    field :route_mbta_id, :string
    field :stop_mbta_id, :string
    field :vehicle_mbta_id, :string
    field :vehicle_int_id, :id
    field :stop_int_id, :id
    field :route_int_id, :id

    timestamps()
  end

  @doc false
  def changeset(prediction, attrs) do
    prediction
    |> cast(attrs, [:vehicle_mbta_id, :stop_mbta_id, :route_mbta_id, :arrival_time, :direction])
    |> validate_required([:vehicle_mbta_id, :stop_mbta_id, :route_mbta_id, :arrival_time, :direction])
  end
end
