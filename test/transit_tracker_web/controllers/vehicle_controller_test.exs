defmodule TransitTrackerWeb.VehicleControllerTest do
  use TransitTrackerWeb.ConnCase

  alias TransitTracker.Transit
  alias TransitTracker.Transit.Vehicle

  @create_attrs %{current_status: "some current_status", vehicle_id: 42}
  @update_attrs %{current_status: "some updated current_status", vehicle_id: 43}
  @invalid_attrs %{current_status: nil, vehicle_id: nil}

  def fixture(:vehicle) do
    {:ok, vehicle} = Transit.create_vehicle(@create_attrs)
    vehicle
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all vehicles", %{conn: conn} do
      conn = get conn, vehicle_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create vehicle" do
    test "renders vehicle when data is valid", %{conn: conn} do
      conn = post conn, vehicle_path(conn, :create), vehicle: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, vehicle_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "current_status" => "some current_status",
        "vehicle_id" => 42}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, vehicle_path(conn, :create), vehicle: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update vehicle" do
    setup [:create_vehicle]

    test "renders vehicle when data is valid", %{conn: conn, vehicle: %Vehicle{id: id} = vehicle} do
      conn = put conn, vehicle_path(conn, :update, vehicle), vehicle: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, vehicle_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "current_status" => "some updated current_status",
        "vehicle_id" => 43}
    end

    test "renders errors when data is invalid", %{conn: conn, vehicle: vehicle} do
      conn = put conn, vehicle_path(conn, :update, vehicle), vehicle: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete vehicle" do
    setup [:create_vehicle]

    test "deletes chosen vehicle", %{conn: conn, vehicle: vehicle} do
      conn = delete conn, vehicle_path(conn, :delete, vehicle)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, vehicle_path(conn, :show, vehicle)
      end
    end
  end

  defp create_vehicle(_) do
    vehicle = fixture(:vehicle)
    {:ok, vehicle: vehicle}
  end
end
