import * as R from 'ramda';
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
      };
    case types.SAVE_CALENDAR_EVENT:
      return {
        ...state,
        loading: true,
      };
    case types.SAVE_CALENDAR_EVENT_SUCCESS:
      return {
        ...state,
        calendarEvents: R.uniqBy(e => e.id)([...state.calendarEvents, action.payload]),
        loading: false,
      };
    default:
      return state;
  }
};

export default reducer;
