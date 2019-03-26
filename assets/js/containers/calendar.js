import { connect } from 'react-redux';
import React from 'react';
import BigCalendar from 'react-big-calendar';
import moment from 'moment';
import { fetchCalendarEvents } from '../actions/calendar';
import 'react-big-calendar/lib/css/react-big-calendar.css';

const localizer = BigCalendar.momentLocalizer(moment);

class Calendar extends React.Component {
  componentWillMount() {
    this.props.fetchCalendarEvents();
  }

  render() {
    const { calendarEvents } = this.props;
    return (
      <div>
        <BigCalendar
          localizer={localizer}
          events={calendarEvents}
          startAccessor="start"
          endAccessor="end"
          defaultDate={new Date()}
          defaultView="month"
          style={{ height: '70vh' }}
        />
      </div>
    );
  }
}

const mapStateToProps = state => ({
  calendarEvents: state.calendar.calendarEvents,
});

const actionCreators = {
  fetchCalendarEvents,
};

export default connect(mapStateToProps, actionCreators)(Calendar);
