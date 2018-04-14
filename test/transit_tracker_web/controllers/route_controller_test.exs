defmodule TransitTrackerWeb.RouteControllerTest do
  use TransitTrackerWeb.ConnCase

  alias TransitTracker.Transit
  alias TransitTracker.Transit.Route

  @create_attrs %{name: "some name", route_id: 42}
  @update_attrs %{name: "some updated name", route_id: 43}
  @invalid_attrs %{name: nil, route_id: nil}

  def fixture(:route) do
    {:ok, route} = Transit.create_route(@create_attrs)
    route
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all routes", %{conn: conn} do
      conn = get conn, route_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create route" do
    test "renders route when data is valid", %{conn: conn} do
      conn = post conn, route_path(conn, :create), route: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, route_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "name" => "some name",
        "route_id" => 42}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, route_path(conn, :create), route: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update route" do
    setup [:create_route]

    test "renders route when data is valid", %{conn: conn, route: %Route{id: id} = route} do
      conn = put conn, route_path(conn, :update, route), route: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, route_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "name" => "some updated name",
        "route_id" => 43}
    end

    test "renders errors when data is invalid", %{conn: conn, route: route} do
      conn = put conn, route_path(conn, :update, route), route: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete route" do
    setup [:create_route]

    test "deletes chosen route", %{conn: conn, route: route} do
      conn = delete conn, route_path(conn, :delete, route)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, route_path(conn, :show, route)
      end
    end
  end

  defp create_route(_) do
    route = fixture(:route)
    {:ok, route: route}
  end
end
