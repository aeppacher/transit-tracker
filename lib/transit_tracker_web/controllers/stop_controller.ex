defmodule TransitTrackerWeb.StopController do
  use TransitTrackerWeb, :controller

  alias TransitTracker.Transit
  alias TransitTracker.Transit.Stop

  action_fallback TransitTrackerWeb.FallbackController

  def index(conn, _params) do
    stops = Transit.list_stops()
    render(conn, "index.json", stops: stops)
  end

  def create(conn, %{"stop" => stop_params}) do
    with {:ok, %Stop{} = stop} <- Transit.create_stop(stop_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", stop_path(conn, :show, stop))
      |> render("show.json", stop: stop)
    end
  end

  def get_stops_by_route(conn, %{"route_id" => id}) do
    stops = Transit.get_stops_by_route(id)
    render(conn, "index.json", stops: stops)
  end

  def get_stops_by_route(conn, %{"route_id" => route_id}) do
    stops = Transit.get_stops_by_route_id(route_id)
    render(conn, "index.json", stops: stops)
  end

  def favorites(conn, %{"user_id" => id}) do
    stops = Transit.get_stops_by_favorites(id)
    render(conn, "index.json", stops: stops)
  end

  def get_stop_by_stop_id(conn, %{"stop_id" => stop_id}) do
    stop = Transit.get_stop_by_stop_id(stop_id)
    render(conn, "show.json", stop: stop)
  end

  def show(conn, %{"id" => id}) do
    stop = Transit.get_stop!(id)
    render(conn, "show.json", stop: stop)
  end

  def update(conn, %{"id" => id, "stop" => stop_params}) do
    stop = Transit.get_stop!(id)

    with {:ok, %Stop{} = stop} <- Transit.update_stop(stop, stop_params) do
      render(conn, "show.json", stop: stop)
    end
  end

  def delete(conn, %{"id" => id}) do
    stop = Transit.get_stop!(id)
    with {:ok, %Stop{}} <- Transit.delete_stop(stop) do
      send_resp(conn, :no_content, "")
    end
  end
end
