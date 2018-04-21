defmodule TransitTracker.UpdateVehicles do
  import Ecto.Query
  
  alias TransitTracker.Repo
  alias TransitTracker.Transit
  alias TransitTracker.Transit.Prediction
  alias TransitTracker.Transit.Vehicle
  
  def parse_vehicles([]) do
  end

  def parse_vehicles(vehicles) do
    vehicle = hd(vehicles)
    attr = vehicle["attributes"]
    route_id = vehicle["relationships"]["route"]["data"]["id"]
    stop_id = vehicle["relationships"]["stop"]["data"]["id"]
    next_stop = Transit.get_stop_by_children(stop_id)
    next_stop_id = if (next_stop == nil) do
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
      route_id: Transit.get_route_by_route_id!(route_id).route_id,
      next_stop_eta: nil, #populated by update_predictions
      direction: attr["direction_id"]}
    Repo.insert!(vehicle_params)

    parse_vehicles(tl(vehicles))
  end

  def poisondecode(url) do
    resp = HTTPoison.get!(url)
    text = Poison.decode!(resp.body)
    text
  end

  def update_predictions([]) do
  end
  
  def update_predictions(predicts) do
    p = hd(predicts)
    arrival_time = p["attributes"]["arrival_time"]
    direction = p["attributes"]["direction_id"]
    route_mbta_id = p["relationships"]["route"]["data"]["id"]
    stop_mbta_id = p["relationships"]["stop"]["data"]["id"]
    vehicle_mbta_id = p["relationships"]["vehicle"]["data"]["id"]

    route = Transit.get_route_by_route_id!(route_mbta_id)
    route_int_id = if is_nil(route) do
      nil
    else
      route.id
    end
    
    stop = Transit.get_stop_by_children(stop_mbta_id)
    stop_int_id = if is_nil(stop) do
      nil
    else
      stop.id
    end

    vehicle = if not is_nil(vehicle_mbta_id) and not is_nil(stop_int_id) do
      query = from v in Vehicle,
	where: v.mbta_id == ^vehicle_mbta_id,
	where: v.next_stop_id == ^stop_int_id,
	select: v
      Repo.one(query)
    else
      nil
    end
    vehicle_int_id = if is_nil(vehicle) do
      nil
    else
      vehicle.id
    end
    
    if not is_nil(vehicle) do
      Transit.update_vehicle(vehicle, %{"next_stop_eta": arrival_time})
    end

    if not is_nil(route_int_id) and not is_nil(stop_int_id) and not is_nil(vehicle_int_id) and not is_nil(arrival_time) do
      prediction_params = %Prediction{
	route_mbta_id: route_mbta_id,
	route_int_id: route_int_id,
	stop_mbta_id: stop_mbta_id,
	stop_int_id: stop_int_id,
	vehicle_mbta_id: vehicle_mbta_id,
	vehicle_int_id: vehicle_int_id,
	arrival_time: nil,
	#arrival_time populated below
	#idk why it broke when i tried to pop it here
	direction: direction}
      prediction = Repo.insert!(prediction_params)      
      Transit.update_prediction(prediction, %{"arrival_time": arrival_time})
    end
    
    update_predictions(tl(predicts))
  end
  
  def run do
    a = poisondecode("https://api-v3.mbta.com/predictions?filter%5Broute%5D=Red,Blue,Green-C,Green-D,Green-E,Green-B&include=vehicle")
    vehicles = a["included"]
    predicts = a["data"]

    
    Repo.delete_all Vehicle
    Repo.delete_all Prediction
    parse_vehicles(vehicles)
    update_predictions(predicts)
  end
end

