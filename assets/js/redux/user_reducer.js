export default function userReducer( state = {
	currentUser: null
}, action ) {
	switch (action.type) {
		case "SET_CURRENT_USER": {
			return {
				...state,
				currentUser: action.payload
			}
		}
		default: {
			return state
		}
	}
}