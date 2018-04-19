import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';

import Route from './route';

import { getRouteData } from '../redux/transit_actions';

const mapDispatchToProps = (dispatch) => bindActionCreators({
	getRouteData,
}, dispatch);

const mapStateToProps = (state) => {
	return {
		currentRoute: state.routes.currentRoute
	}
}

const RouteContainer = connect(mapStateToProps, mapDispatchToProps)(Route);
export default RouteContainer;