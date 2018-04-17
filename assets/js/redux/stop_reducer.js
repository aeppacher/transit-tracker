export default function stopReducer( state = {
	allStops: []
}, action ) {
	switch (action.type) {
		case "SET_ALL_STOPS": {
			return {
				...state,
				allStops: action.payload
			}
		}
		default: {
			return state
		}
	}
}