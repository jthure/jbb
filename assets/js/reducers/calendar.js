import types from '../constants';

const initialState = {
  calendarEvents: [],
};

const reducer = function itemHasErrored(state = initialState, action) {
  switch (action.type) {
    case types.FETCH_CALENDAR_EVENTS_SUCESS:
      return { ...state, calendarEvents: action.payload };
    default:
      return state;
  }
};

export default reducer;
