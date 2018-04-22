import React from 'react';
import { Nav, Navbar, NavbarBrand, Collapse, Button } from 'reactstrap';

import { Link, Redirect } from 'react-router-dom';

import StopCard from './stop_card';

class Favorites extends React.Component {
	constructor(props) {
		super(props);

		console.log(this.props, "favorites props");

		this.toggleStops = this.toggleStops.bind(this);

		this.state = 
		{
			stopsCollapsed: true,
			favoritesPulled: false
		}
	}

	toggleStops() {
		this.setState({stopsCollapsed: !this.state.stopsCollapsed});
	}

	// sorting function copied from stack overflow answer here
	// https://stackoverflow.com/questions/8837454/sort-array-of-objects-by-single-key-with-date-value
	sortByKey(array, key) {
		let tempArray = array.slice();
		return tempArray.sort(function(a, b) {
			let x = a[key];
			let y = b[key];
			return ((x < y) ? -1 : ((x > y) ? 1 : 0));
		});
	}

	render(){
		if(this.props.currentUser !== null && this.state.favoritesPulled === false){
			this.props.getFavorites(this.props.currentUser.id);
			this.setState({favoritesPulled: true});
		}

		let unsortedStops = this.state.favoritesPulled === true ? this.props.favoriteStops : [];
		let sortedStops = this.sortByKey(unsortedStops, "name");
		let stop_cards = _.map(sortedStops, (ss) => <StopCard key={ss.id} stop={ss} />);

		let dropdownStyle = 
		{
			marginTop: "10px",
			borderRadius: "0.25em"
		}

		const minusImageUrl = "https://i.imgur.com/6HeCKEF.png";
		const plusImageUrl = "https://i.imgur.com/P8twezm.png";

		return (
			<div>
				<Navbar style={dropdownStyle} color="light" light expand="md">
					Stations
					<Nav className="ml-auto" navbar>
						<Button color="link" onClick={this.toggleStops}>
							<img src={this.state.stopsCollapsed == true ? minusImageUrl : plusImageUrl}/>
						</Button>
					</Nav>
				</Navbar>
				<Collapse isOpen={this.state.stopsCollapsed}>
          {stop_cards}
        </Collapse>
			</div>
		);
	}
}

export default Favorites;