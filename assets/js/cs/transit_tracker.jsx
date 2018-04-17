import React, { Component } from 'react';
import { BrowserRouter as Router, Route } from 'react-router-dom';

import { setAllStops } from '../redux/transit_actions';

import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';

import FeedContainer from './feed_container';
import Nav from './nav';


class TransitTracker extends Component {
	constructor(props) {
		super(props);
	}

	componentDidMount(){
		this.getData();
	}

	getData(){
		this.props.setAllStops();
	}

	render() {
		return (
			<Router>
				<div>
					<Route path="/" exact={true} render={() =>
						<div>
							<Nav />
							<FeedContainer store={this.props.store} />
						</div>
					} />
					<Route path="/stop/:stop_id" render={() =>
						<div>
							<Nav />
						</div>
					} />
				</div>
			</Router>
		);
	}
}

const mapDispatchToProps = (dispatch) => bindActionCreators({
	setAllStops
}, dispatch);

export default connect(null, mapDispatchToProps)(TransitTracker);