import * as types from '../constants/ui';

const initialState = {
  calendarEventModalOpen: false,
  selectedEvent: null,
};

const ui = (state = initialState, action) => {
  switch (action.type) {
    case types.CALENDAR_EVENT_MODAL_OPEN:
      return {
        ...state,
        calendarEventModalOpen: true,
      };
    case types.CALENDAR_EVENT_MODAL_CLOSE:
      return {
        ...state,
        calendarEventModalOpen: false,
      };

    case types.CALENDAR_EVENT_SELECT:
      return {
        ...state,
        selectedEvent: action.payload,
      };
    case types.CALENDAR_EVENT_CLEAR_SELECTED:
      return {
        ...state,
        selectedEvent: null,
      };

    default: return state;
  }
};

export default ui;
