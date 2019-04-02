import * as types from '../constants/ui';

export const openCalendarEventModal = () => (dispatch) => {
  dispatch({
    type: types.CALENDAR_EVENT_MODAL_OPEN,
  });
};

export const closeCalendarEventModal = () => (dispatch) => {
  dispatch({
    type: types.CALENDAR_EVENT_MODAL_CLOSE,
  });
};
