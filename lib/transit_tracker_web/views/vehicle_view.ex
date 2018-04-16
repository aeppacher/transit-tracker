defmodule TransitTrackerWeb.VehicleView do
  use TransitTrackerWeb, :view
  alias TransitTrackerWeb.VehicleView

  def render("index.json", %{vehicles: vehicles}) do
    %{data: render_many(vehicles, VehicleView, "vehicle.json")}
  end

  def render("show.json", %{vehicle: vehicle}) do
    %{data: render_one(vehicle, VehicleView, "vehicle.json")}
  end

  def render("vehicle.json", %{vehicle: vehicle}) do
    %{id: vehicle.id,
      mbta_id: vehicle.mbta_id,
      lat: vehicle.lat,
      long: vehicle.long,
      current_status: vehicle.current_status,
      next_stop_eta: vehicle.next_stop_eta,
      direction: vehicle.direction,
      route_id: vehicle.route_id,
      next_stop_id: vehicle.next_stop_id}
  end
end
