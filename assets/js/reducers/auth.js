import * as R from 'ramda';
import types from '../constants';

const initialState = {
  loggedIn: false,
  userName: null,
  name: null,
};

const reducer = (state = initialState, action) => {
  switch (action.type) {
    case types.AUTH_ME:
      return {
        ...state,
        loading: true,
      };
    case types.AUTH_ME_SUCCESS:
      return {
        ...state,
        loggedIn: !!action.payload,
        userName: action.payload ? action.payload.username : null,
        name: action.payload ? action.payload.name : null,

        loading: false,
      };
    case types.AUTH_ME_FAIL:
      return {
        ...state,
        loggedIn: false,
        loading: false,
      };
    case types.AUTH_LOGIN:
      return {
        ...state,
        loading: true,
      };
    case types.AUTH_LOGIN_SUCCESS:
      return {
        ...state,
        loggedIn: true,
        loading: false,
      };
    case types.AUTH_LOGIN_FAIL:
      return {
        ...state,
        loggedIn: false,
        loading: false,
      };
    default:
      return state;
  }
};

export default reducer;
