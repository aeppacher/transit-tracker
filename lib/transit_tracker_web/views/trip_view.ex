defmodule TransitTrackerWeb.TripView do
  use TransitTrackerWeb, :view
  alias TransitTrackerWeb.TripView

  def render("index.json", %{trips: trips}) do
    %{data: render_many(trips, TripView, "trip.json")}
  end

  def render("show.json", %{trip: trip}) do
    %{data: render_one(trip, TripView, "trip.json")}
  end

  def render("trip.json", %{trip: trip}) do
    %{id: trip.id,
      trip_id: trip.trip_id}
  end
end
