import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';

import Favorites from './favorites';

const mapStateToProps = (state) => {
	return {
		currentUser: state.user.currentUser
	}
}

const FavoritesContainer = connect(mapStateToProps)(Favorites);
export default FavoritesContainer;