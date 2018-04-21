import React from 'react';
import { NavItem, Nav, Navbar, NavbarBrand, NavLink, UncontrolledDropdown, DropdownToggle, DropdownMenu, DropdownItem,   } from 'reactstrap';

import { getCurrentUser } from '../redux/transit_actions';

import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

class CustomNav extends React.Component {
	componentDidMount(){
		let user_id = window.user;

		if(user_id !== undefined){
			this.props.getCurrentUser(user_id);
		}
	}

	render() {
		console.log(this.props);

		let navlinkStyle = {
			color: "#212529"
		}

		let user_first_name = this.props.currentUser !== null ? this.props.currentUser.first_name : "noname";

		const loggedInMenu = 
		<UncontrolledDropdown nav inNavbar>
			<DropdownToggle nav caret>
				{user_first_name}
			</DropdownToggle>
			<DropdownMenu right>
				<DropdownItem>
					<NavLink style={navlinkStyle} href="/favorites">Favorites</NavLink>
				</DropdownItem>
			</DropdownMenu>
		</UncontrolledDropdown>

		const loggedOutMenu = 
			<NavItem>
				<NavLink href="/auth/google?scope=email%20profile">Login</NavLink>
			</NavItem>;

		let navbarOptions = this.props.currentUser !== null ? loggedInMenu : loggedOutMenu;

		return (
			<div>
				<Navbar color="dark" dark expand="md">
					<NavbarBrand href="/">TransitTracker</NavbarBrand>
					<Nav className="ml-auto" navbar>
						{ navbarOptions }
					</Nav>
				</Navbar>
			</div>
		);
	}
}

const mapDispatchToProps = (dispatch) => bindActionCreators({
	getCurrentUser
}, dispatch);


const mapStateToProps = (state) => {
	return {
		currentUser: state.user.currentUser
	}
}

export default connect(mapStateToProps, mapDispatchToProps)(CustomNav);