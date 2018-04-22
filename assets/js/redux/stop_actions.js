export function setAllStops(stops) {
	return {
		type: 'SET_ALL_STOPS',
		payload: stops
	}
}

export function setStopData(stop) {
	return {
		type: 'SET_STOP_DATA',
		payload: stop
	}
}

export function setCurrentRouteStops(stop) {
	return {
		type: 'SET_CURRENT_ROUTE_STOPS',
		payload: stop
	}
}