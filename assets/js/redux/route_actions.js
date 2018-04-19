export function setAllRoutes(routes) {
	return {
		type: 'SET_ALL_ROUTES',
		payload: routes
	}
}

export function setRouteData(routes) {
	return {
		type: 'SET_ROUTE_DATA',
		payload: routes
	}
}