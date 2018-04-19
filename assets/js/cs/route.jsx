import React from 'react';
import { Button, Card, CardBody, CardTitle, CardText } from 'reactstrap';
import { NavLink } from 'react-router-dom';

import Nav from './nav';

class Route extends React.Component {
	constructor(props) {
		super(props);

		console.log(props, "route props");
	}

	componentDidMount(){
		this.getData();
	}

	getData(){
		this.props.getRouteData(this.props.match.params.route_id);
	}

	render(){
		console.log(this.props, "render props");
		return(
			<div>
				<Nav />
			</div>
		);
	}
}

export default Route;