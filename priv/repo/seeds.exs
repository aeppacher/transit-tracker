# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TransitTracker.Repo.insert!(%TransitTracker.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
#
defmodule Seeds do
  alias TransitTracker.Repo
  alias TransitTracker.Transit.Route
  alias TransitTracker.Transit.Stop
  alias TransitTracker.Transit
  
  def parse_stops([]) do
  end

  def parse_stops(stops) do
    stop = (hd stops)
    attr = stop["attributes"]
    route = stop["relationships"]["route"]["data"]["id"]
    stop_params = %Stop{ lat: attr["latitude"], long: attr["longitude"], name: attr["name"], stop_id: stop["id"], routes: [route]}
    case Repo.get_by(Stop, stop_id: stop_params.stop_id) do
      nil ->
        Repo.insert!(stop_params)
      stop ->
        Transit.update_stop(stop, %{routes: stop.routes ++ [route]})
    end
    parse_stops((tl stops))
  end

  def parse_route([]) do
  end

  def get_name(route) do
    attr = route["attributes"]
    if attr["long_name"] != "" do
      attr["long_name"]
    else 
      attr["short_name"]
    end
  end

  def parse_route(routes) do
    route = (hd routes)
    a = Repo.insert!(%Route{ dir_0: Enum.at(route["attributes"]["direction_names"], 0), dir_1: Enum.at(route["attributes"]["direction_names"], 1), name: get_name(route), route_id: route["id"]})
    parse_route((tl routes))
  end
  
  def run do
    Repo.delete_all Route
    resp = HTTPoison.get!('https://api-v3.mbta.com/routes?filter%5Btype%5D=0%2C1')
    text = Poison.decode!(resp.body)
    data = text["data"]
    parse_route(data)
    Repo.delete_all Stop
    resp = HTTPoison.get!('https://api-v3.mbta.com/stops?filter[route]=Red&include=route')
    text = Poison.decode!(resp.body)
    data = text["data"]
    parse_stops(data)
    resp = HTTPoison.get!('https://api-v3.mbta.com/stops?filter[route]=Green-B&include=route')
    text = Poison.decode!(resp.body)
    data = text["data"]
    parse_stops(data)
    resp = HTTPoison.get!('https://api-v3.mbta.com/stops?filter[route]=Green-C&include=route')
    text = Poison.decode!(resp.body)
    data = text["data"]
    parse_stops(data)
    resp = HTTPoison.get!('https://api-v3.mbta.com/stops?filter[route]=Green-D&include=route')
    text = Poison.decode!(resp.body)
    data = text["data"]
    parse_stops(data)
    resp = HTTPoison.get!('https://api-v3.mbta.com/stops?filter[route]=Orange&include=route')
    text = Poison.decode!(resp.body)
    data = text["data"]
    parse_stops(data)
    resp = HTTPoison.get!('https://api-v3.mbta.com/stops?filter[route]=Blue&include=route')
    text = Poison.decode!(resp.body)
    data = text["data"]
    parse_stops(data)
  end

end

Seeds.run



