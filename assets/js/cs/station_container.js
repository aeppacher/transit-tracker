import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';

import Station from './station';

import { getStopData } from '../redux/transit_actions';

const mapDispatchToProps = (dispatch) => bindActionCreators({
	getStopData,
}, dispatch);

const mapStateToProps = (state) => {
	return {
		currentStop: state.stops.currentStop
	}
}

const StationContainer = connect(mapStateToProps, mapDispatchToProps)(Station);
export default StationContainer;