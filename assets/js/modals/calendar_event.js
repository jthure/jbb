import React from 'react';
import Button from '@material-ui/core/Button';
import TextField from '@material-ui/core/TextField';
import Dialog from '@material-ui/core/Dialog';
import DialogActions from '@material-ui/core/DialogActions';
import DialogContent from '@material-ui/core/DialogContent';
import DialogContentText from '@material-ui/core/DialogContentText';
import DialogTitle from '@material-ui/core/DialogTitle';
import FormControl from '@material-ui/core/FormControl';
import MenuItem from '@material-ui/core/MenuItem';
import Select from '@material-ui/core/Select';
import InputLabel from '@material-ui/core/InputLabel';
import { withStyles } from '@material-ui/core/styles';
import moment from 'moment';


const styles = theme => ({
  formControl: {
    minWidth: 120,
  },
});

const newEvent = () => ({
  name: '',
  start: moment(),
  end: moment().add(1, 'day'),
  status: '',
});

class CalendarEventModal extends React.Component {
  constructor(props) {
    super(props);
    this.state = newEvent();
  }

  static getDerivedStateFromProps(nextProps, prevState) {
    if (nextProps.calendarEvent && nextProps.calendarEvent.id !== prevState.id) {
      console.log(nextProps.calendarEvent);
      return {
        ...nextProps.calendarEvent,
        start: moment(nextProps.calendarEvent.start),
        end: moment(nextProps.calendarEvent.end),
        status: nextProps.calendarEvent.calendar_event_status ? nextProps.calendarEvent.calendar_event_status.id : '',
      };
    }
    return null;
  }


  render() {
    const {
      calendarEvent, calendarEventStatuses, open,
      closeModal, saveCalendarEvent, classes,
    } = this.props;
    const {
      name, start, end, status, id,
    } = this.state;
    return (
      <Dialog
        open={open}
        onClose={closeModal}
        aria-labelledby="form-dialog-title"
      >
        <DialogTitle id="form-dialog-title">Add new event</DialogTitle>
        <DialogContent>
          <DialogContentText>Add a new event to the Calendar.</DialogContentText>
          <TextField
            autoFocus
            margin="dense"
            id="name"
            label="Title"
            type="text"
            fullWidth
            value={name}
            onChange={e => this.setState({ name: e.target.value })}
          />
          <TextField
            autoFocus
            margin="dense"
            id="start"
            label="Start date"
            type="date"
            fullWidth
            InputLabelProps={{
              shrink: true,
            }}
            onChange={e => this.setState({ start: moment(e.target.value) })}
            value={start.format('YYYY-MM-DD')}
          />
          <TextField
            autoFocus
            margin="dense"
            id="end"
            label="End date"
            type="date"
            fullWidth
            InputLabelProps={{
              shrink: true,
            }}
            onChange={e => this.setState({ end: moment(e.target.value) })}
            value={end.format('YYYY-MM-DD')}
          />
          <FormControl className={classes.formControl}>
            <InputLabel htmlFor="status">Status</InputLabel>
            <Select
              autoWidth
              value={status}
              onChange={e => this.setState({ status: e.target.value })}
              inputProps={{
                name: 'status',
                id: 'status',
              }}
            >
              {calendarEventStatuses.map(s => <MenuItem value={s.id}>{s.name}</MenuItem>)}
            </Select>
          </FormControl>
        </DialogContent>
        <DialogActions>
          <Button onClick={closeModal} color="primary">Cancel</Button>
          <Button
            onClick={() => {
              saveCalendarEvent({
                name, start, end, calendar_event_status_id: status, id,
              });
              closeModal();
            }}
            color="primary"
          >
            {'Save'}
          </Button>
        </DialogActions>
      </Dialog>
    );
  }
}

export default withStyles(styles)(CalendarEventModal);
