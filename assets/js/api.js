import store from './store';

class Server {
	request_stops() {
		$.ajax("/api/stops", {
			method: "get",
			dataType: "json",
			contentType: "application/json; charset=UTF-8",
			success: (response) => {
				store.dispatch({
					type: 'STOPS_LIST',
					stops: response.data
				})
			}
		});
	}
}

export default new Server();