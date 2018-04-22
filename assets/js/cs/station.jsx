import React from 'react';
import { Button, Card, CardBody, CardTitle, CardText } from 'reactstrap';
import { NavLink } from 'react-router-dom';

import CustomNav from './custom_nav';

class Station extends React.Component {


	constructor(props) {
		super(props);

		this.addFavorite = this.addFavorite.bind(this);
		let user_id = window.user;

		if(this.props.currentUser !== undefined){
			this.state = { loggedIn: true};
		}
		else {
			this.state = { loggedIn: false};
		}
	}

	componentDidMount(){
		this.getData();
	}

	getData(){
		this.props.getStopData(this.props.match.params.stop_id);
	}

	addFavorite(){
		let favorites = this.props.currentUser.favorites;
		favorites.push(this.props.currentStop.stop_id);

		console.log(favorites, "favorites");
		this.props.addFavorite(favorites, this.props.currentUser.id);
	}

	render(){
		let routes = this.props.currentStop.routes;

		let routeCards = _.map(routes, (rr, index) => 
    <CardText key={index}>
    	<NavLink to={"/route/" + rr}>{rr}</NavLink>
    </CardText>);

		let favoritesButton = <Button color="link" onClick={this.addFavorite}>
			Add to favorites
		</Button>;
		//let alreadyFavorited = this.props.currentUser.favorites.indexOf(this.props.current)

		let favorites = this.state.loggedIn !== false ? favoritesButton : null;

		console.log(this.props, "render props");
		return (
			<div>
				<CustomNav />
				<Card >
					<CardBody>
		        <CardTitle >
		       		{"Station - " + this.props.currentStop.name}
		       		{favorites}
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