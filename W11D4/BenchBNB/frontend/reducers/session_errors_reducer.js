import { RECEIVE_SESSION_ERRORS } from "../actions/session_actions";
import { RECEIVE_CURRENT_USER } from '../actions/session_actions';

export default (state = {}, action) => {
    Object.freeze(state);
    switch (action.type) {
        case RECEIVE_SESSION_ERRORS:
            return Object.assign({}, state, {errors: action.errors})
        case RECEIVE_CURRENT_USER:    
            return Object.assign({}, state, { errors: null })
        default:
            return state;
    }
}