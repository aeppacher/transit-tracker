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
      prediction_id: prediction.prediction_id,
      arrival_time: prediction.arrival_time,
      departure_time: prediction.departure_time}
  end
end
