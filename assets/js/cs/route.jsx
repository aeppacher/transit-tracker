import React from 'react';
import { Button, Card, CardBody, CardTitle, CardText } from 'reactstrap';
import { NavLink } from 'react-router-dom';

import CustomNav from './custom_nav';

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
		return (
			<div>
				<CustomNav />
				<Card >
					<CardBody>
		        <CardTitle >
		       		{"Route - " + this.props.currentRoute.name}
		        </CardTitle>
		        <CardTitle>
		        	{"Directions - " + this.props.currentRoute.dir_0 + " + " + this.props.currentRoute.dir_1}
		       	</CardTitle>
				  </CardBody>
			  </Card>
			</div>
		);
	}
}

export default Route;