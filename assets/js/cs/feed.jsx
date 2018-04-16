import React from 'react';

import { Link, Redirect } from 'react-router-dom';
import Stop from './stop';

export default function Feed(props) {
	console.log(props);
	let stops = _.map(props.stops, (ss) => <Stop key={ss.id} stop={ss} />);
	return (
	<div>
		{stops}
	</div>
	);
}