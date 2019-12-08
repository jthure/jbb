import moment from 'moment';
import types from '../constants';
import * as api from '../api';

export const fetchCalendarEvents = () => async (dispatch) => {
  dispatch({
    type: types.FETCH_CALENDAR_EVENTS,
  });

  try {
    const res = await api.fetchCalendarEvents();
    const { data } = res.data;
    dispatch({
      type: types.FETCH_CALENDAR_EVENTS_SUCCESS,
      payload: data.map(event => ({
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

export const saveCalendarEvent = event => async (dispatch) => {
  dispatch({
    type: types.SAVE_CALENDAR_EVENT,
  });
  try {
    console.log(event);
    const res = await api.saveCalendarEvent(event);
    const { data } = res.data;
    dispatch({
      type: types.SAVE_CALENDAR_EVENT_SUCCESS,
      payload: {
        ...data,
        title: event.name,
        start: moment(event.start).toDate(),
        end: moment(event.end).toDate(),
      },
    });
  } catch (error) {
    dispatch({
      type: types.SAVE_CALENDAR_EVENT_FAIL,
    });
  }
};

export const fetchCalendarEventStatuses = () => async (dispatch) => {
  dispatch({
    type: types.FETCH_CALENDAR_EVENT_STATUSES,
  });
  try {
    const res = await api.fetchCalendarEventStatuses();
    const { data } = res.data;
    dispatch({
      type: types.FETCH_CALENDAR_EVENT_STATUSES_SUCCESS,
      payload: data,
    });
  } catch (error) {
    console.log(error);
    dispatch({
      type: types.FETCH_CALENDAR_EVENT_STATUSES_FAIL,
    });
  }
};
