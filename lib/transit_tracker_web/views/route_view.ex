defmodule TransitTrackerWeb.RouteView do
  use TransitTrackerWeb, :view
  alias TransitTrackerWeb.RouteView

  def render("index.json", %{routes: routes}) do
    %{data: render_many(routes, RouteView, "route.json")}
  end

  def render("show.json", %{route: route}) do
    %{data: render_one(route, RouteView, "route.json")}
  end

  def render("route.json", %{route: route}) do
    %{id: route.id,
      name: route.name,
      route_id: route.route_id,
      dir_0: route.dir_0,
      dir_1: route.dir_1}
  end
end
