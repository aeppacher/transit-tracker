defmodule TransitTrackerWeb.StopView do
  use TransitTrackerWeb, :view
  alias TransitTrackerWeb.StopView

  def render("index.json", %{stops: stops}) do
    %{data: render_many(stops, StopView, "stop.json")}
  end

  def render("show.json", %{stop: stop}) do
    %{data: render_one(stop, StopView, "stop.json")}
  end

  def render("stop.json", %{stop: stop}) do
    %{id: stop.id,
      name: stop.name,
      stop_id: stop.stop_id,
      lat: stop.lat,
      long: stop.long,
      routes: stop.routes,
      children: stop.children}
  end
end
