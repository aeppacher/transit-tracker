import { connect } from 'react-redux';
import Feed from './feed';

const mapStateToProps = (state) => {
	return {
		allStops: state.feed.allStops
	}
}

const FeedContainer = connect(mapStateToProps)(Feed);
export default FeedContainer;