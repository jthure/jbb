import moment from 'moment';
import types from '../constants';
import * as api from '../api';

export function fetchCalendarEvents() {
  return async (dispatch) => {
    dispatch({
      type: types.FETCH_CALENDAR_EVENTS,
    });

    try {
      const res = await api.fetchCalendarEvents();
      dispatch({
        type: types.FETCH_CALENDAR_EVENTS_SUCCESS,
        payload: res.data.data.map(event => ({
          ...event,
          title: event.name,
          start: moment(event.start).toDate(),
          end: moment(event.end).toDate(),
        })),
      });
    } catch (error) {
      dispatch({
        type: types.FETCH_CALENDAR_EVENTS_FAIL,
      });
    }
  };
}
