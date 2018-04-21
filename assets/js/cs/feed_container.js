import { connect } from 'react-redux';
import Feed from './feed';

const mapStateToProps = (state) => {
	return {
		allStops: state.stops.allStops,
		allRoutes: state.routes.allRoutes
	}
}

const FeedContainer = connect(mapStateToProps)(Feed);
export default FeedContainer;