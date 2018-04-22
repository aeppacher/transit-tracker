import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';

import { getFavorites } from '../redux/transit_actions';

import Favorites from './favorites';

const mapStateToProps = (state) => {
	return {
		currentUser: state.user.currentUser,
		favoriteStops: state.user.favoriteStops
	}
}

const mapDispatchToProps = (dispatch) => bindActionCreators({
	getFavorites,
}, dispatch);

const FavoritesContainer = connect(mapStateToProps, mapDispatchToProps)(Favorites);
export default FavoritesContainer;