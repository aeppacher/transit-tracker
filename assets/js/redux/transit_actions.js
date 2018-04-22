import * as StopActions from './stop_actions';
import * as RouteActions from './route_actions';
import * as UserActions from './user_actions';

export function getCurrentUser(user_id){
	return (dispatch) => {
		$.ajax("/api/users/" + user_id, {
			method: "get",
			dataType: "json",
			contentType: "application/json; charset=UTF-8",
			success: (response) => {
				console.log(response.data, "response");
				dispatch(UserActions.setCurrentUser(response.data));
			},
			error: (error) => {
				console.log(error, "setCurrentUser error");
			}
		});
	}
}

export function addFavorite(favorites, user_id) {
	return (dispatch) => {
		$.ajax("/api/users/" + user_id, {
			method: "put",
			dataType: "json",
			contentType: "application/json; charset=UTF-8",
			data: JSON.stringify({
                user: {"favorites" : favorites}
			}),
			success: (response) => {
				//nothing
			},
			error: (error) => {
				console.log(favorites, "favorites passed");
				console.log(error, "addFavorite errors");
			}
		});
	}
}

export function setAllStops() {
	return (dispatch) => {
		$.ajax("/api/stops", {
			method: "get",
			dataType: "json",
			contentType: "application/json; charset=UTF-8",
			success: (response) => {
				dispatch(StopActions.setAllStops(response.data));
			},
			error: (error) => {
				console.log(error, "setAllStops errors");
			}
		});
	}
}

export function getStopData(stop_id){
	return (dispatch) => {
		$.ajax("/api/stops/id/" + stop_id, {
			method: "get",
			dataType: "json",
			contentType: "application/json; charset=UTF-8",
			success: (response) => {
				console.log(response, "response");
				dispatch(StopActions.setStopData(response.data));
			},
			error: (error) => {
				console.log(error, "setStopData errors");
			}
		});
	}
}

export function setAllRoutes() {
	return (dispatch) => {
		$.ajax("/api/routes", {
			method: "get",
			dataType: "json",
			contentType: "application/json; charset=UTF-8",
			success: (response) => {
				dispatch(RouteActions.setAllRoutes(response.data));
			},
			error: (error) => {
				console.log(error, "setAllRoutes errors");
			}
		});
	}
}

export function getRouteData(route_id){
	return (dispatch) => {
		$.ajax("/api/routes/id/" + route_id, {
			method: "get",
			dataType: "json",
			contentType: "application/json; charset=UTF-8",
			success: (response) => {
				console.log(response, "response");
				dispatch(RouteActions.setRouteData(response.data));
			},
			error: (error) => {
				console.log(error, "setRouteData errors");
			}
		});
	}
}
