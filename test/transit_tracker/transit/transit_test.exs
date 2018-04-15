defmodule TransitTracker.TransitTest do
  use TransitTracker.DataCase

  alias TransitTracker.Transit

  describe "routes" do
    alias TransitTracker.Transit.Route

    @valid_attrs %{dir_0: "some dir_0", dir_1: "some dir_1", name: "some name", route_id: "some route_id"}
    @update_attrs %{dir_0: "some updated dir_0", dir_1: "some updated dir_1", name: "some updated name", route_id: "some updated route_id"}
    @invalid_attrs %{dir_0: nil, dir_1: nil, name: nil, route_id: nil}

    def route_fixture(attrs \\ %{}) do
      {:ok, route} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Transit.create_route()

      route
    end

    test "list_routes/0 returns all routes" do
      route = route_fixture()
      assert Transit.list_routes() == [route]
    end

    test "get_route!/1 returns the route with given id" do
      route = route_fixture()
      assert Transit.get_route!(route.id) == route
    end

    test "create_route/1 with valid data creates a route" do
      assert {:ok, %Route{} = route} = Transit.create_route(@valid_attrs)
      assert route.dir_0 == "some dir_0"
      assert route.dir_1 == "some dir_1"
      assert route.name == "some name"
      assert route.route_id == "some route_id"
    end

    test "create_route/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Transit.create_route(@invalid_attrs)
    end

    test "update_route/2 with valid data updates the route" do
      route = route_fixture()
      assert {:ok, route} = Transit.update_route(route, @update_attrs)
      assert %Route{} = route
      assert route.dir_0 == "some updated dir_0"
      assert route.dir_1 == "some updated dir_1"
      assert route.name == "some updated name"
      assert route.route_id == "some updated route_id"
    end

    test "update_route/2 with invalid data returns error changeset" do
      route = route_fixture()
      assert {:error, %Ecto.Changeset{}} = Transit.update_route(route, @invalid_attrs)
      assert route == Transit.get_route!(route.id)
    end

    test "delete_route/1 deletes the route" do
      route = route_fixture()
      assert {:ok, %Route{}} = Transit.delete_route(route)
      assert_raise Ecto.NoResultsError, fn -> Transit.get_route!(route.id) end
    end

    test "change_route/1 returns a route changeset" do
      route = route_fixture()
      assert %Ecto.Changeset{} = Transit.change_route(route)
    end
  end

  describe "stops" do
    alias TransitTracker.Transit.Stop

    @valid_attrs %{name: "some name", stop_id: "some stop_id"}
    @update_attrs %{name: "some updated name", stop_id: "some updated stop_id"}
    @invalid_attrs %{name: nil, stop_id: nil}

    def stop_fixture(attrs \\ %{}) do
      {:ok, stop} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Transit.create_stop()

      stop
    end

    test "list_stops/0 returns all stops" do
      stop = stop_fixture()
      assert Transit.list_stops() == [stop]
    end

    test "get_stop!/1 returns the stop with given id" do
      stop = stop_fixture()
      assert Transit.get_stop!(stop.id) == stop
    end

    test "create_stop/1 with valid data creates a stop" do
      assert {:ok, %Stop{} = stop} = Transit.create_stop(@valid_attrs)
      assert stop.name == "some name"
      assert stop.stop_id == "some stop_id"
    end

    test "create_stop/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Transit.create_stop(@invalid_attrs)
    end

    test "update_stop/2 with valid data updates the stop" do
      stop = stop_fixture()
      assert {:ok, stop} = Transit.update_stop(stop, @update_attrs)
      assert %Stop{} = stop
      assert stop.name == "some updated name"
      assert stop.stop_id == "some updated stop_id"
    end

    test "update_stop/2 with invalid data returns error changeset" do
      stop = stop_fixture()
      assert {:error, %Ecto.Changeset{}} = Transit.update_stop(stop, @invalid_attrs)
      assert stop == Transit.get_stop!(stop.id)
    end

    test "delete_stop/1 deletes the stop" do
      stop = stop_fixture()
      assert {:ok, %Stop{}} = Transit.delete_stop(stop)
      assert_raise Ecto.NoResultsError, fn -> Transit.get_stop!(stop.id) end
    end

    test "change_stop/1 returns a stop changeset" do
      stop = stop_fixture()
      assert %Ecto.Changeset{} = Transit.change_stop(stop)
    end
  end

  describe "stops" do
    alias TransitTracker.Transit.Stop

    @valid_attrs %{lat: 42, long: 42, name: "some name", stop_id: "some stop_id"}
    @update_attrs %{lat: 43, long: 43, name: "some updated name", stop_id: "some updated stop_id"}
    @invalid_attrs %{lat: nil, long: nil, name: nil, stop_id: nil}

    def stop_fixture(attrs \\ %{}) do
      {:ok, stop} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Transit.create_stop()

      stop
    end

    test "list_stops/0 returns all stops" do
      stop = stop_fixture()
      assert Transit.list_stops() == [stop]
    end

    test "get_stop!/1 returns the stop with given id" do
      stop = stop_fixture()
      assert Transit.get_stop!(stop.id) == stop
    end

    test "create_stop/1 with valid data creates a stop" do
      assert {:ok, %Stop{} = stop} = Transit.create_stop(@valid_attrs)
      assert stop.lat == 42
      assert stop.long == 42
      assert stop.name == "some name"
      assert stop.stop_id == "some stop_id"
    end

    test "create_stop/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Transit.create_stop(@invalid_attrs)
    end

    test "update_stop/2 with valid data updates the stop" do
      stop = stop_fixture()
      assert {:ok, stop} = Transit.update_stop(stop, @update_attrs)
      assert %Stop{} = stop
      assert stop.lat == 43
      assert stop.long == 43
      assert stop.name == "some updated name"
      assert stop.stop_id == "some updated stop_id"
    end

    test "update_stop/2 with invalid data returns error changeset" do
      stop = stop_fixture()
      assert {:error, %Ecto.Changeset{}} = Transit.update_stop(stop, @invalid_attrs)
      assert stop == Transit.get_stop!(stop.id)
    end

    test "delete_stop/1 deletes the stop" do
      stop = stop_fixture()
      assert {:ok, %Stop{}} = Transit.delete_stop(stop)
      assert_raise Ecto.NoResultsError, fn -> Transit.get_stop!(stop.id) end
    end

    test "change_stop/1 returns a stop changeset" do
      stop = stop_fixture()
      assert %Ecto.Changeset{} = Transit.change_stop(stop)
    end
  end

  describe "stops" do
    alias TransitTracker.Transit.Stop

    @valid_attrs %{lat: 120.5, long: 120.5, name: "some name", stop_id: "some stop_id"}
    @update_attrs %{lat: 456.7, long: 456.7, name: "some updated name", stop_id: "some updated stop_id"}
    @invalid_attrs %{lat: nil, long: nil, name: nil, stop_id: nil}

    def stop_fixture(attrs \\ %{}) do
      {:ok, stop} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Transit.create_stop()

      stop
    end

    test "list_stops/0 returns all stops" do
      stop = stop_fixture()
      assert Transit.list_stops() == [stop]
    end

    test "get_stop!/1 returns the stop with given id" do
      stop = stop_fixture()
      assert Transit.get_stop!(stop.id) == stop
    end

    test "create_stop/1 with valid data creates a stop" do
      assert {:ok, %Stop{} = stop} = Transit.create_stop(@valid_attrs)
      assert stop.lat == 120.5
      assert stop.long == 120.5
      assert stop.name == "some name"
      assert stop.stop_id == "some stop_id"
    end

    test "create_stop/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Transit.create_stop(@invalid_attrs)
    end

    test "update_stop/2 with valid data updates the stop" do
      stop = stop_fixture()
      assert {:ok, stop} = Transit.update_stop(stop, @update_attrs)
      assert %Stop{} = stop
      assert stop.lat == 456.7
      assert stop.long == 456.7
      assert stop.name == "some updated name"
      assert stop.stop_id == "some updated stop_id"
    end

    test "update_stop/2 with invalid data returns error changeset" do
      stop = stop_fixture()
      assert {:error, %Ecto.Changeset{}} = Transit.update_stop(stop, @invalid_attrs)
      assert stop == Transit.get_stop!(stop.id)
    end

    test "delete_stop/1 deletes the stop" do
      stop = stop_fixture()
      assert {:ok, %Stop{}} = Transit.delete_stop(stop)
      assert_raise Ecto.NoResultsError, fn -> Transit.get_stop!(stop.id) end
    end

    test "change_stop/1 returns a stop changeset" do
      stop = stop_fixture()
      assert %Ecto.Changeset{} = Transit.change_stop(stop)
    end
  end

  describe "on_route" do
    alias TransitTracker.Transit.On_Routes

    @valid_attrs %{route_id: "some route_id", stop_id: "some stop_id"}
    @update_attrs %{route_id: "some updated route_id", stop_id: "some updated stop_id"}
    @invalid_attrs %{route_id: nil, stop_id: nil}

    def on__routes_fixture(attrs \\ %{}) do
      {:ok, on__routes} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Transit.create_on__routes()

      on__routes
    end

    test "list_on_route/0 returns all on_route" do
      on__routes = on__routes_fixture()
      assert Transit.list_on_route() == [on__routes]
    end

    test "get_on__routes!/1 returns the on__routes with given id" do
      on__routes = on__routes_fixture()
      assert Transit.get_on__routes!(on__routes.id) == on__routes
    end

    test "create_on__routes/1 with valid data creates a on__routes" do
      assert {:ok, %On_Routes{} = on__routes} = Transit.create_on__routes(@valid_attrs)
      assert on__routes.route_id == "some route_id"
      assert on__routes.stop_id == "some stop_id"
    end

    test "create_on__routes/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Transit.create_on__routes(@invalid_attrs)
    end

    test "update_on__routes/2 with valid data updates the on__routes" do
      on__routes = on__routes_fixture()
      assert {:ok, on__routes} = Transit.update_on__routes(on__routes, @update_attrs)
      assert %On_Routes{} = on__routes
      assert on__routes.route_id == "some updated route_id"
      assert on__routes.stop_id == "some updated stop_id"
    end

    test "update_on__routes/2 with invalid data returns error changeset" do
      on__routes = on__routes_fixture()
      assert {:error, %Ecto.Changeset{}} = Transit.update_on__routes(on__routes, @invalid_attrs)
      assert on__routes == Transit.get_on__routes!(on__routes.id)
    end

    test "delete_on__routes/1 deletes the on__routes" do
      on__routes = on__routes_fixture()
      assert {:ok, %On_Routes{}} = Transit.delete_on__routes(on__routes)
      assert_raise Ecto.NoResultsError, fn -> Transit.get_on__routes!(on__routes.id) end
    end

    test "change_on__routes/1 returns a on__routes changeset" do
      on__routes = on__routes_fixture()
      assert %Ecto.Changeset{} = Transit.change_on__routes(on__routes)
    end
  end
end
