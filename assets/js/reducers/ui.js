import * as types from '../constants/ui';

const initialState = {
  calendarEventModalOpen: false,
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

    default: return state;
  }
};

export default ui;
