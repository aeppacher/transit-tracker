defmodule TransitTrackerWeb.PredictionControllerTest do
  use TransitTrackerWeb.ConnCase

  alias TransitTracker.Transit
  alias TransitTracker.Transit.Prediction

  @create_attrs %{arrival_time: "2010-04-17 14:00:00.000000Z", direction: 42, route_mbta_id: "some route_mbta_id", stop_mbta_id: "some stop_mbta_id", vehicle_mbta_id: "some vehicle_mbta_id"}
  @update_attrs %{arrival_time: "2011-05-18 15:01:01.000000Z", direction: 43, route_mbta_id: "some updated route_mbta_id", stop_mbta_id: "some updated stop_mbta_id", vehicle_mbta_id: "some updated vehicle_mbta_id"}
  @invalid_attrs %{arrival_time: nil, direction: nil, route_mbta_id: nil, stop_mbta_id: nil, vehicle_mbta_id: nil}

  def fixture(:prediction) do
    {:ok, prediction} = Transit.create_prediction(@create_attrs)
    prediction
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all predictions", %{conn: conn} do
      conn = get conn, prediction_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create prediction" do
    test "renders prediction when data is valid", %{conn: conn} do
      conn = post conn, prediction_path(conn, :create), prediction: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, prediction_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "arrival_time" => "2010-04-17 14:00:00.000000Z",
        "direction" => 42,
        "route_mbta_id" => "some route_mbta_id",
        "stop_mbta_id" => "some stop_mbta_id",
        "vehicle_mbta_id" => "some vehicle_mbta_id"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, prediction_path(conn, :create), prediction: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update prediction" do
    setup [:create_prediction]

    test "renders prediction when data is valid", %{conn: conn, prediction: %Prediction{id: id} = prediction} do
      conn = put conn, prediction_path(conn, :update, prediction), prediction: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, prediction_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "arrival_time" => "2011-05-18 15:01:01.000000Z",
        "direction" => 43,
        "route_mbta_id" => "some updated route_mbta_id",
        "stop_mbta_id" => "some updated stop_mbta_id",
        "vehicle_mbta_id" => "some updated vehicle_mbta_id"}
    end

    test "renders errors when data is invalid", %{conn: conn, prediction: prediction} do
      conn = put conn, prediction_path(conn, :update, prediction), prediction: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete prediction" do
    setup [:create_prediction]

    test "deletes chosen prediction", %{conn: conn, prediction: prediction} do
      conn = delete conn, prediction_path(conn, :delete, prediction)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, prediction_path(conn, :show, prediction)
      end
    end
  end

  defp create_prediction(_) do
    prediction = fixture(:prediction)
    {:ok, prediction: prediction}
  end
end
