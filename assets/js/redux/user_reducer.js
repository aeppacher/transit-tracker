export default function userReducer( state = {
	currentUser: null,
	favoriteStops: []
}, action ) {
	switch (action.type) {
		case "SET_CURRENT_USER": {
			return {
				...state,
				currentUser: action.payload
			}
		}
		case "SET_FAVORITES": {
			return {
				...state,
				favoriteStops: action.payload
			}
		}
		default: {
			return state
		}
	}
}