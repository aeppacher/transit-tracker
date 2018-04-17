defmodule TransitTracker.UpdateVehicles do
  alias TransitTracker.Repo
  alias TransitTracker.Transit.Vehicle
  alias TransitTracker.Transit
  
  def parse_vehicles([]) do
  end

  def parse_vehicles(vehicles) do
    vehicle = hd(vehicles)
    attr = vehicle["attributes"]
    route_id = vehicle["relationships"]["route"]["data"]["id"]
    stop_id = vehicle["relationships"]["stop"]["data"]["id"]
    next_stop = Transit.get_stop_by_children(stop_id)
    next_stop_id = if (next_stop == nil) do
      #IO.inspect(vehicle);
      nil
    else
      next_stop.id
    end
    
    vehicle_params = %Vehicle{
      mbta_id: vehicle["id"],
      lat: attr["latitude"],
      long: attr["longitude"],
      current_status: attr["current_status"],
      next_stop_id: next_stop_id,
      route_id: Transit.get_route_by_route_id!(route_id).id,
      next_stop_eta: nil, #TODO: attr[""],
      direction: attr["direction_id"]}
    
    Repo.insert!(vehicle_params)

    parse_vehicles(tl(vehicles))
  end

  def poisondecode(url) do
    resp = HTTPoison.get!(url)
    text = Poison.decode!(resp.body)
    text
  end
  
  def run do
    Repo.delete_all Vehicle
    a = poisondecode("https://api-v3.mbta.com/predictions?filter%5Broute%5D=Red,Blue,Green-C,Green-D,Green-E,Green-B&include=vehicle")
    vehicles = a["included"]
    predicts = a["data"]
    
    parse_vehicles(vehicles)
  end
end

