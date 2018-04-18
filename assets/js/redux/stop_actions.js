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