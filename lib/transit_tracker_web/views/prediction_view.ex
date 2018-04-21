defmodule TransitTrackerWeb.PredictionView do
  use TransitTrackerWeb, :view
  alias TransitTrackerWeb.PredictionView

  def render("index.json", %{predictions: predictions}) do
    %{data: render_many(predictions, PredictionView, "prediction.json")}
  end

  def render("show.json", %{prediction: prediction}) do
    %{data: render_one(prediction, PredictionView, "prediction.json")}
  end

  def render("prediction.json", %{prediction: prediction}) do
    %{id: prediction.id,
      vehicle_mbta_id: prediction.vehicle_mbta_id,
      stop_mbta_id: prediction.stop_mbta_id,
      route_mbta_id: prediction.route_mbta_id,
      vehicle_int_id: prediction.vehicle_int_id,
      stop_int_id: prediction.stop_int_id,
      route_int_id: prediction.route_int_id,
      arrival_time: prediction.arrival_time,
      direction: prediction.direction}
  end
end
