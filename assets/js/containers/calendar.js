import { connect } from 'react-redux';
import React from 'react';
import { fetchCalendarEvents } from '../actions/calendar';


class Calendar extends React.Component {
  componentWillMount() {
    this.props.fetchCalendarEvents();
  }

  render() {
    return (
      <div>
        Hej
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
