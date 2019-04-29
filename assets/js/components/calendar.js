import React from 'react';
import BigCalendar from 'react-big-calendar';
import moment from 'moment';
import Fab from '@material-ui/core/Fab';
import AddIcon from '@material-ui/icons/Add';
import { withStyles } from '@material-ui/core/styles';
import 'react-big-calendar/lib/css/react-big-calendar.css';

const localizer = BigCalendar.momentLocalizer(moment);

const styles = theme => ({
  addBar: {
    display: 'flex',
    flexGrow: '1',
  },
  grow: {
    flexGrow: '1',
  },
});

const Calendar = ({ classes, calendarEvents, openCalendarModal }) => (
  <div>
    <BigCalendar
      localizer={localizer}
      events={calendarEvents}
      startAccessor="start"
      endAccessor="end"
      onSelectEvent={(event) => { console.log(event); openCalendarModal(event); }}
      defaultDate={new Date()}
      defaultView="month"
      style={{ height: '70vh' }}
    />
    <div className={classes.addBar}>
      <div className={classes.grow} />
      <Fab
        onClick={openCalendarModal}
        color="primary"
      >
        <AddIcon />
      </Fab>
    </div>
  </div>

);

export default withStyles(styles)(Calendar);
