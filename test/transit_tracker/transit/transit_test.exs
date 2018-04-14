defmodule TransitTracker.TransitTest do
  use TransitTracker.DataCase

  alias TransitTracker.Transit

  describe "stations" do
    alias TransitTracker.Transit.Station

    @valid_attrs %{name: "some name", station_id: 42}
    @update_attrs %{name: "some updated name", station_id: 43}
    @invalid_attrs %{name: nil, station_id: nil}

    def station_fixture(attrs \\ %{}) do
      {:ok, station} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Transit.create_station()

      station
    end

    test "list_stations/0 returns all stations" do
      station = station_fixture()
      assert Transit.list_stations() == [station]
    end

    test "get_station!/1 returns the station with given id" do
      station = station_fixture()
      assert Transit.get_station!(station.id) == station
    end

    test "create_station/1 with valid data creates a station" do
      assert {:ok, %Station{} = station} = Transit.create_station(@valid_attrs)
      assert station.name == "some name"
      assert station.station_id == 42
    end

    test "create_station/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Transit.create_station(@invalid_attrs)
    end

    test "update_station/2 with valid data updates the station" do
      station = station_fixture()
      assert {:ok, station} = Transit.update_station(station, @update_attrs)
      assert %Station{} = station
      assert station.name == "some updated name"
      assert station.station_id == 43
    end

    test "update_station/2 with invalid data returns error changeset" do
      station = station_fixture()
      assert {:error, %Ecto.Changeset{}} = Transit.update_station(station, @invalid_attrs)
      assert station == Transit.get_station!(station.id)
    end

    test "delete_station/1 deletes the station" do
      station = station_fixture()
      assert {:ok, %Station{}} = Transit.delete_station(station)
      assert_raise Ecto.NoResultsError, fn -> Transit.get_station!(station.id) end
    end

    test "change_station/1 returns a station changeset" do
      station = station_fixture()
      assert %Ecto.Changeset{} = Transit.change_station(station)
    end
  end

  describe "stops" do
    alias TransitTracker.Transit.Stop

    @valid_attrs %{name: "some name", station_id: 42}
    @update_attrs %{name: "some updated name", station_id: 43}
    @invalid_attrs %{name: nil, station_id: nil}

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
      assert stop.station_id == 42
    end

    test "create_stop/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Transit.create_stop(@invalid_attrs)
    end

    test "update_stop/2 with valid data updates the stop" do
      stop = stop_fixture()
      assert {:ok, stop} = Transit.update_stop(stop, @update_attrs)
      assert %Stop{} = stop
      assert stop.name == "some updated name"
      assert stop.station_id == 43
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

    @valid_attrs %{name: "some name", stop_id: 42}
    @update_attrs %{name: "some updated name", stop_id: 43}
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
      assert stop.stop_id == 42
    end

    test "create_stop/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Transit.create_stop(@invalid_attrs)
    end

    test "update_stop/2 with valid data updates the stop" do
      stop = stop_fixture()
      assert {:ok, stop} = Transit.update_stop(stop, @update_attrs)
      assert %Stop{} = stop
      assert stop.name == "some updated name"
      assert stop.stop_id == 43
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

  describe "routes" do
    alias TransitTracker.Transit.Route

    @valid_attrs %{name: "some name", route_id: 42}
    @update_attrs %{name: "some updated name", route_id: 43}
    @invalid_attrs %{name: nil, route_id: nil}

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
      assert route.name == "some name"
      assert route.route_id == 42
    end

    test "create_route/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Transit.create_route(@invalid_attrs)
    end

    test "update_route/2 with valid data updates the route" do
      route = route_fixture()
      assert {:ok, route} = Transit.update_route(route, @update_attrs)
      assert %Route{} = route
      assert route.name == "some updated name"
      assert route.route_id == 43
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

  describe "vehicles" do
    alias TransitTracker.Transit.Vehicle

    @valid_attrs %{current_status: "some current_status", vehicle_id: 42}
    @update_attrs %{current_status: "some updated current_status", vehicle_id: 43}
    @invalid_attrs %{current_status: nil, vehicle_id: nil}

    def vehicle_fixture(attrs \\ %{}) do
      {:ok, vehicle} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Transit.create_vehicle()

      vehicle
    end

    test "list_vehicles/0 returns all vehicles" do
      vehicle = vehicle_fixture()
      assert Transit.list_vehicles() == [vehicle]
    end

    test "get_vehicle!/1 returns the vehicle with given id" do
      vehicle = vehicle_fixture()
      assert Transit.get_vehicle!(vehicle.id) == vehicle
    end

    test "create_vehicle/1 with valid data creates a vehicle" do
      assert {:ok, %Vehicle{} = vehicle} = Transit.create_vehicle(@valid_attrs)
      assert vehicle.current_status == "some current_status"
      assert vehicle.vehicle_id == 42
    end

    test "create_vehicle/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Transit.create_vehicle(@invalid_attrs)
    end

    test "update_vehicle/2 with valid data updates the vehicle" do
      vehicle = vehicle_fixture()
      assert {:ok, vehicle} = Transit.update_vehicle(vehicle, @update_attrs)
      assert %Vehicle{} = vehicle
      assert vehicle.current_status == "some updated current_status"
      assert vehicle.vehicle_id == 43
    end

    test "update_vehicle/2 with invalid data returns error changeset" do
      vehicle = vehicle_fixture()
      assert {:error, %Ecto.Changeset{}} = Transit.update_vehicle(vehicle, @invalid_attrs)
      assert vehicle == Transit.get_vehicle!(vehicle.id)
    end

    test "delete_vehicle/1 deletes the vehicle" do
      vehicle = vehicle_fixture()
      assert {:ok, %Vehicle{}} = Transit.delete_vehicle(vehicle)
      assert_raise Ecto.NoResultsError, fn -> Transit.get_vehicle!(vehicle.id) end
    end

    test "change_vehicle/1 returns a vehicle changeset" do
      vehicle = vehicle_fixture()
      assert %Ecto.Changeset{} = Transit.change_vehicle(vehicle)
    end
  end

  describe "trips" do
    alias TransitTracker.Transit.Trip

    @valid_attrs %{trip_id: "some trip_id"}
    @update_attrs %{trip_id: "some updated trip_id"}
    @invalid_attrs %{trip_id: nil}

    def trip_fixture(attrs \\ %{}) do
      {:ok, trip} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Transit.create_trip()

      trip
    end

    test "list_trips/0 returns all trips" do
      trip = trip_fixture()
      assert Transit.list_trips() == [trip]
    end

    test "get_trip!/1 returns the trip with given id" do
      trip = trip_fixture()
      assert Transit.get_trip!(trip.id) == trip
    end

    test "create_trip/1 with valid data creates a trip" do
      assert {:ok, %Trip{} = trip} = Transit.create_trip(@valid_attrs)
      assert trip.trip_id == "some trip_id"
    end

    test "create_trip/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Transit.create_trip(@invalid_attrs)
    end

    test "update_trip/2 with valid data updates the trip" do
      trip = trip_fixture()
      assert {:ok, trip} = Transit.update_trip(trip, @update_attrs)
      assert %Trip{} = trip
      assert trip.trip_id == "some updated trip_id"
    end

    test "update_trip/2 with invalid data returns error changeset" do
      trip = trip_fixture()
      assert {:error, %Ecto.Changeset{}} = Transit.update_trip(trip, @invalid_attrs)
      assert trip == Transit.get_trip!(trip.id)
    end

    test "delete_trip/1 deletes the trip" do
      trip = trip_fixture()
      assert {:ok, %Trip{}} = Transit.delete_trip(trip)
      assert_raise Ecto.NoResultsError, fn -> Transit.get_trip!(trip.id) end
    end

    test "change_trip/1 returns a trip changeset" do
      trip = trip_fixture()
      assert %Ecto.Changeset{} = Transit.change_trip(trip)
    end
  end

  describe "predictions" do
    alias TransitTracker.Transit.Prediction

    @valid_attrs %{arrival_time: "some arrival_time", departure_time: "some departure_time", prediction_id: "some prediction_id"}
    @update_attrs %{arrival_time: "some updated arrival_time", departure_time: "some updated departure_time", prediction_id: "some updated prediction_id"}
    @invalid_attrs %{arrival_time: nil, departure_time: nil, prediction_id: nil}

    def prediction_fixture(attrs \\ %{}) do
      {:ok, prediction} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Transit.create_prediction()

      prediction
    end

    test "list_predictions/0 returns all predictions" do
      prediction = prediction_fixture()
      assert Transit.list_predictions() == [prediction]
    end

    test "get_prediction!/1 returns the prediction with given id" do
      prediction = prediction_fixture()
      assert Transit.get_prediction!(prediction.id) == prediction
    end

    test "create_prediction/1 with valid data creates a prediction" do
      assert {:ok, %Prediction{} = prediction} = Transit.create_prediction(@valid_attrs)
      assert prediction.arrival_time == "some arrival_time"
      assert prediction.departure_time == "some departure_time"
      assert prediction.prediction_id == "some prediction_id"
    end

    test "create_prediction/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Transit.create_prediction(@invalid_attrs)
    end

    test "update_prediction/2 with valid data updates the prediction" do
      prediction = prediction_fixture()
      assert {:ok, prediction} = Transit.update_prediction(prediction, @update_attrs)
      assert %Prediction{} = prediction
      assert prediction.arrival_time == "some updated arrival_time"
      assert prediction.departure_time == "some updated departure_time"
      assert prediction.prediction_id == "some updated prediction_id"
    end

    test "update_prediction/2 with invalid data returns error changeset" do
      prediction = prediction_fixture()
      assert {:error, %Ecto.Changeset{}} = Transit.update_prediction(prediction, @invalid_attrs)
      assert prediction == Transit.get_prediction!(prediction.id)
    end

    test "delete_prediction/1 deletes the prediction" do
      prediction = prediction_fixture()
      assert {:ok, %Prediction{}} = Transit.delete_prediction(prediction)
      assert_raise Ecto.NoResultsError, fn -> Transit.get_prediction!(prediction.id) end
    end

    test "change_prediction/1 returns a prediction changeset" do
      prediction = prediction_fixture()
      assert %Ecto.Changeset{} = Transit.change_prediction(prediction)
    end
  end

  describe "stops" do
    alias TransitTracker.Transit.Stop

    @valid_attrs %{stop_id: "some stop_id"}
    @update_attrs %{stop_id: "some updated stop_id"}
    @invalid_attrs %{stop_id: nil}

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
      assert stop.stop_id == "some stop_id"
    end

    test "create_stop/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Transit.create_stop(@invalid_attrs)
    end

    test "update_stop/2 with valid data updates the stop" do
      stop = stop_fixture()
      assert {:ok, stop} = Transit.update_stop(stop, @update_attrs)
      assert %Stop{} = stop
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
end
