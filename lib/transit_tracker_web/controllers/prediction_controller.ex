defmodule TransitTrackerWeb.PredictionController do
  use TransitTrackerWeb, :controller

  alias TransitTracker.Transit
  alias TransitTracker.Transit.Prediction

  action_fallback TransitTrackerWeb.FallbackController

  def index(conn, _params) do
    predictions = Transit.list_predictions()
    render(conn, "index.json", predictions: predictions)
  end

  def create(conn, %{"prediction" => prediction_params}) do
    with {:ok, %Prediction{} = prediction} <- Transit.create_prediction(prediction_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", prediction_path(conn, :show, prediction))
      |> render("show.json", prediction: prediction)
    end
  end

  def show(conn, %{"id" => id}) do
    prediction = Transit.get_prediction!(id)
    render(conn, "show.json", prediction: prediction)
  end

  def update(conn, %{"id" => id, "prediction" => prediction_params}) do
    prediction = Transit.get_prediction!(id)

    with {:ok, %Prediction{} = prediction} <- Transit.update_prediction(prediction, prediction_params) do
      render(conn, "show.json", prediction: prediction)
    end
  end

  def delete(conn, %{"id" => id}) do
    prediction = Transit.get_prediction!(id)
    with {:ok, %Prediction{}} <- Transit.delete_prediction(prediction) do
      send_resp(conn, :no_content, "")
    end
  end

  def list_predictions_by_stop_int_id(conn, %{"stop_int_id" => stop_int_id}) do
    predictions = Transit.list_predictions_by_stop_int_id(stop_int_id)
    render(conn, "index.json", predictions: predictions)
  end
end
