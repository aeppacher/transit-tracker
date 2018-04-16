import React from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter as Router, Route, Redirect } from 'react-router-dom';
import { Provider, connect } from 'react-redux';

import Feed from './feed';

export default function transit_tracker_init(store) {
	ReactDOM.render(
		<Provider store={store}>
			<TransitTracker state={store.getState()} />
		</Provider>,
		document.getElementById('root')
	);
}

let TransitTracker = connect((state) => state)((props) => {
	return (
		<Router>
			<div>
				<Route path="/" exact={true} render={() =>
					<div>
						<Feed stops={props.stops}/>
					</div>
				} />
			</div>
		</Router>
	);
})