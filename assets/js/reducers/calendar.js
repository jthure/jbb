import types from '../constants';

const initialState = {
  calendarEvents: [],
};

const reducer = (state = initialState, action) => {
  switch (action.type) {
    case types.FETCH_CALENDAR_EVENTS:
      return {
        ...state,
        loading: true,
      };
    case types.FETCH_CALENDAR_EVENTS_SUCCESS:
      return {
        ...state,
        calendarEvents: action.payload,
        loading: false,
      };
    case types.FETCH_CALENDAR_EVENTS_FAIL:
      return {
        ...state,
        loading: false,
      }
    default:
      return state;
  }
};

export default reducer;
