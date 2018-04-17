export default function stopReducer( state = {
	allStops: [],
	currentStop: []
}, action ) {
	switch (action.type) {
		case "SET_ALL_STOPS": {
			return {
				...state,
				allStops: action.payload
			}
		}
		case "SET_STOP_DATA": {
			return {
				...state,
				currentStop: action.payload
			}
		}
		default: {
			return state
		}
	}
}