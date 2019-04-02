import { connect } from 'react-redux';
import React from 'react';
import { fetchCalendarEvents } from '../actions/calendar';
import { openCalendarEventModal, closeCalendarEventModal } from '../actions/ui';
import CalendarComponent from '../components/calendar';
import CalendarEventModal from '../modals/calendar_event';


class Calendar extends React.Component {
  componentWillMount() {
    this.props.fetchCalendarEvents();
  }

  render() {
    const {
      calendarEvents, calendarEventModalOpen, openCalendarEventModal, closeCalendarEventModal,
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
        />
      </div>
    );
  }
}

const mapStateToProps = state => ({
  calendarEvents: state.calendar.calendarEvents,
  calendarEventModalOpen: state.ui.calendarEventModalOpen,
});

const actionCreators = {
  fetchCalendarEvents,
  openCalendarEventModal,
  closeCalendarEventModal,
};

export default connect(mapStateToProps, actionCreators)(Calendar);
