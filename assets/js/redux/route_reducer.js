export default function routeReducer( state = {
	allRoutes: [],
	currentRoute: []
}, action ) {
	switch (action.type) {
		case "SET_ALL_ROUTES": {
			return {
				...state,
				allRoutes: action.payload
			}
		}
		case "SET_ROUTE_DATA": {
			return {
				...state,
				currentRoute: action.payload
			}
		}
		default: {
			return state
		}
	}
}