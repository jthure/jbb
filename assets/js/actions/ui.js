import * as types from '../constants/ui';

export const openCalendarEventModal = event => (dispatch) => {
  if (event) {
    dispatch({
      type: types.CALENDAR_EVENT_SELECT,
      payload: event,
    });
  }
  dispatch({
    type: types.CALENDAR_EVENT_MODAL_OPEN,
  });
};

export const closeCalendarEventModal = () => (dispatch) => {
  dispatch({
    type: types.CALENDAR_EVENT_CLEAR_SELECTED,
  });
  dispatch({
    type: types.CALENDAR_EVENT_MODAL_CLOSE,
  });
};
