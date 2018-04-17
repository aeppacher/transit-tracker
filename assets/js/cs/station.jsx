import React from 'react';
import { Button, Card, CardBody, CardTitle, CardText } from 'reactstrap';
import { NavLink } from 'react-router-dom';

import Nav from './nav';

class Station extends React.Component {


	constructor(props) {
		super(props);

		console.log(props, "station props");
	}

	componentDidMount(){
		this.getData();
	}

	getData(){
		this.props.getStopData(this.props.match.params.stop_id);
	}

	render(){
		let routes = this.props.currentStop.routes;

		let routeCards = _.map(routes, (rr, index) => 
    <CardText key={index}>
    	<NavLink to={"/routes/" + rr}>{rr}</NavLink>
    </CardText>);


		console.log(this.props, "render props");
		return (
			<div>
				<Nav />
				<Card >
					<CardBody>
		        <CardTitle >
		       		{"Station - " + this.props.currentStop.name}
		        </CardTitle>
			    	<CardTitle >
		       		Routes
		        </CardTitle>
				    <CardBody>
			        {routeCards}
				    </CardBody>
			    	<CardTitle >
		       		Arrivals A:
		        </CardTitle>
			      <CardBody>
				    </CardBody>
			    	<CardTitle >
		       		Arrivals B:
		        </CardTitle>
			      <CardBody>
				    </CardBody>
				   </CardBody>
			  </Card>
			</div>
		);
	}
}

export default Station;