import React from 'react';

import { Link, Redirect } from 'react-router-dom';
import Stop from './stop';

export default function Feed(props) {
	let sortedStops = sortByKey(props.stops, "name")
	let stops = _.map(sortedStops, (ss) => <Stop key={ss.id} stop={ss} />);
	
	return (
		<div>
			{stops}
		</div>
	);
}

// sorting function copied from stack overflow answer here
// https://stackoverflow.com/questions/8837454/sort-array-of-objects-by-single-key-with-date-value
function sortByKey(array, key) {
	let tempArray = array.slice();
  return tempArray.sort(function(a, b) {
    let x = a[key];
    let y = b[key];
    return ((x < y) ? -1 : ((x > y) ? 1 : 0));
  });
}