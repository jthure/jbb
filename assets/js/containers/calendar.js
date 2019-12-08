import { connect } from 'react-redux';
import React from 'react';
import { fetchCalendarEvents, saveCalendarEvent, fetchCalendarEventStatuses } from '../actions/calendar';
import { openCalendarEventModal, closeCalendarEventModal } from '../actions/ui';
import CalendarComponent from '../components/calendar';
import CalendarEventModal from '../modals/calendar_event';

import { login } from '../actions/auth';


class Calendar extends React.Component {
  componentWillMount() {
    this.props.fetchCalendarEvents();
    this.props.fetchCalendarEventStatuses();
    // this.props.login('jthure', 'test');
  }

  render() {
    const {
      calendarEvents, calendarEventStatuses, calendarEventModalOpen, openCalendarEventModal,
      closeCalendarEventModal, saveCalendarEvent, selectedEvent,
    } = this.props;
    return (
      <div>
        <CalendarComponent
          calendarEvents={calendarEvents}
          openCalendarModal={openCalendarEventModal}
        />
        <CalendarEventModal
          open={calendarEventModalOpen}
          closeModal={closeCalendarEventModal}
          saveCalendarEvent={saveCalendarEvent}
          calendarEventStatuses={calendarEventStatuses}
          calendarEvent={selectedEvent}
        />
      </div>
    );
  }
}

const mapStateToProps = state => ({
  selectedEvent: state.ui.selectedEvent,
  calendarEvents: state.calendar.calendarEvents,
  calendarEventStatuses: state.calendar.calendarEventStatuses,
  calendarEventModalOpen: state.ui.calendarEventModalOpen,
});

const actionCreators = {
  fetchCalendarEvents,
  saveCalendarEvent,
  fetchCalendarEventStatuses,
  openCalendarEventModal,
  closeCalendarEventModal,
  login,
};

export default connect(mapStateToProps, actionCreators)(Calendar);
