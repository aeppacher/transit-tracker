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
      current_status: vehicle.current_status,
      vehicle_id: vehicle.vehicle_id}
  end
end
