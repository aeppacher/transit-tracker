import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';

import Route from './route';

import { getRouteData, getCurrentRouteStops } from '../redux/transit_actions';

const mapDispatchToProps = (dispatch) => bindActionCreators({
	getRouteData,
	getCurrentRouteStops
}, dispatch);

const mapStateToProps = (state) => {
	return {
		currentRoute: state.routes.currentRoute,
		currentRouteStops: state.routes.currentRouteStops
	}
}

const RouteContainer = connect(mapStateToProps, mapDispatchToProps)(Route);
export default RouteContainer;