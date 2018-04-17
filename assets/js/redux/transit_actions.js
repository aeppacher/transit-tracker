import * as StopActions from './stop_actions';

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