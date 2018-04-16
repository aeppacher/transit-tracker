import React from 'react';
import { NavLink } from 'react-router-dom';
import { Form, FormGroup, NavItem } from 'reactstrap';
import { connect } from 'react-redux';

function Nav(props) {
	return (
		<nav className="navbar navbar-dark bg-dark navbar-expand">
			<span className="navbar-brand">
				Transit Tracker
			</span>
		</nav>
	);
}

function dispatchToProps(state) {
	//for future login/account implementation
	return {
	};
}

export default connect(dispatchToProps)(Nav);