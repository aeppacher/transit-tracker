// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import React from 'react';
import "phoenix_html";

import stopReducer from './redux/stop_reducer';
import routeReducer from './redux/route_reducer';
import userReducer from './redux/user_reducer';

import thunk from "redux-thunk";
import promise from "redux-promise-middleware";

import ReactDOM from 'react-dom';
import TransitTracker from './cs/transit_tracker';
import  { createStore, combineReducers, applyMiddleware } from "redux";
import { Provider, connect } from 'react-redux';
// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"

const allReducers = combineReducers({
	stops: stopReducer,
	routes: routeReducer,
	user: userReducer
});

let store = createStore(
	allReducers,
	{},
	applyMiddleware(thunk, promise())
);

store.subscribe(() => {
	console.log("store changed", store.getState())
});

const app = document.getElementById('root');

ReactDOM.render(
<Provider store={store}>
	<TransitTracker />
</Provider>, app);