defmodule TransitTrackerWeb.PageController do
  use TransitTrackerWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
