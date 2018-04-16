defmodule TransitTrackerWeb.VehicleController do
  use TransitTrackerWeb, :controller

  alias TransitTracker.Transit
  alias TransitTracker.Transit.Vehicle

  action_fallback TransitTrackerWeb.FallbackController

  def index(conn, _params) do
    vehicles = Transit.list_vehicles()
    render(conn, "index.json", vehicles: vehicles)
  end

  def create(conn, %{"vehicle" => vehicle_params}) do
    with {:ok, %Vehicle{} = vehicle} <- Transit.create_vehicle(vehicle_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", vehicle_path(conn, :show, vehicle))
      |> render("show.json", vehicle: vehicle)
    end
  end

  def show(conn, %{"id" => id}) do
    vehicle = Transit.get_vehicle!(id)
    render(conn, "show.json", vehicle: vehicle)
  end

  def update(conn, %{"id" => id, "vehicle" => vehicle_params}) do
    vehicle = Transit.get_vehicle!(id)

    with {:ok, %Vehicle{} = vehicle} <- Transit.update_vehicle(vehicle, vehicle_params) do
      render(conn, "show.json", vehicle: vehicle)
    end
  end

  def delete(conn, %{"id" => id}) do
    vehicle = Transit.get_vehicle!(id)
    with {:ok, %Vehicle{}} <- Transit.delete_vehicle(vehicle) do
      send_resp(conn, :no_content, "")
    end
  end
end
