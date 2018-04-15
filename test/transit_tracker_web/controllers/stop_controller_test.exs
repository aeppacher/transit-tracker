defmodule TransitTrackerWeb.StopControllerTest do
  use TransitTrackerWeb.ConnCase

  alias TransitTracker.Transit
  alias TransitTracker.Transit.Stop

  @create_attrs %{lat: 120.5, long: 120.5, name: "some name", stop_id: "some stop_id"}
  @update_attrs %{lat: 456.7, long: 456.7, name: "some updated name", stop_id: "some updated stop_id"}
  @invalid_attrs %{lat: nil, long: nil, name: nil, stop_id: nil}

  def fixture(:stop) do
    {:ok, stop} = Transit.create_stop(@create_attrs)
    stop
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all stops", %{conn: conn} do
      conn = get conn, stop_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create stop" do
    test "renders stop when data is valid", %{conn: conn} do
      conn = post conn, stop_path(conn, :create), stop: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, stop_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "lat" => 120.5,
        "long" => 120.5,
        "name" => "some name",
        "stop_id" => "some stop_id"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, stop_path(conn, :create), stop: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update stop" do
    setup [:create_stop]

    test "renders stop when data is valid", %{conn: conn, stop: %Stop{id: id} = stop} do
      conn = put conn, stop_path(conn, :update, stop), stop: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, stop_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "lat" => 456.7,
        "long" => 456.7,
        "name" => "some updated name",
        "stop_id" => "some updated stop_id"}
    end

    test "renders errors when data is invalid", %{conn: conn, stop: stop} do
      conn = put conn, stop_path(conn, :update, stop), stop: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete stop" do
    setup [:create_stop]

    test "deletes chosen stop", %{conn: conn, stop: stop} do
      conn = delete conn, stop_path(conn, :delete, stop)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, stop_path(conn, :show, stop)
      end
    end
  end

  defp create_stop(_) do
    stop = fixture(:stop)
    {:ok, stop: stop}
  end
end
