import { createStore, combineReducers } from 'redux';
import deepFreeze from 'deep-freeze';

function stops(state = [], action) {
	switch (action.type) {
		case 'STOPS_LIST':
			return [...action.stops];
		default:
			return state;
	}
}

function routes(state = [], action) {
	switch (action.type){
		case 'ROUTES_LIST':
			return [...action.routes];
		default:
			return state;
	}
}

function root_reducer(state0, action) {
	let reducer = combineReducers({stops, routes});

	let state1 = reducer(state0, action);
	return deepFreeze(state1);
}

let store = createStore(root_reducer);

export default store;