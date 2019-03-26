import types from '../constants';

export function fetchCalendarEvents() {
  return async (dispatch) => {
    dispatch({
      type: types.FETCH_CALENDAR_EVENTS,
    });

    try {

    } catch (error) {

    }
  };
}
