import React from 'react';
import { Button, Card, CardBody, CardTitle, CardText } from 'reactstrap';
import { NavLink } from 'react-router-dom';

import CustomNav from './custom_nav';

class Station extends React.Component {


	constructor(props) {
		super(props);

		this.addFavorite = this.addFavorite.bind(this);
		this.removeFavorite = this.removeFavorite.bind(this);
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
		console.log(this.props, "matched");
		this.props.getStopData(this.props.match.params.stop_id);
		//this.props.getStopArrivals(this.props.match.params);
	}

	addFavorite(){
		let favorites = this.props.currentUser.favorites;
		favorites.push(this.props.currentStop.stop_id);

		this.props.addFavorite(favorites, this.props.currentUser.id);
		location.reload();
	}

	removeFavorite(){
		let favorites = this.props.currentUser.favorites;
		var index = favorites.indexOf(this.props.currentStop.stop_id);
		if (index > -1) {
		  favorites.splice(index, 1);
		}
		this.props.addFavorite(favorites, this.props.currentUser.id);
		location.reload();
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
		let unfavoriteButton = <Button color="link" onClick={this.removeFavorite}>
			Remove from favorites
		</Button>;
		let favorites = null;

		if(this.props.currentUser !== null){
			console.log(this.props, "logged in props");
			let currentFavorites = this.props.currentUser.favorites !== null
			if(this.props.currentUser.favorites.indexOf(this.props.currentStop.stop_id) == -1){
				favorites = favoritesButton;
			}
			else{
				favorites = unfavoriteButton;
			}
		}

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
		       		Direction A
		       		<CardText>
					    	No Predictions, this might be due to the MBTA Api having outages again
					    </CardText>
		        </CardTitle>
			      <CardBody>
				    </CardBody>
			    	<CardTitle >
		       		Direction B
		       		<CardText>
					    	No Predictions, this might be due to the MBTA Api having outages again
					    </CardText>
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