import React from 'react';
import Button from '@material-ui/core/Button';
import TextField from '@material-ui/core/TextField';
import Dialog from '@material-ui/core/Dialog';
import DialogActions from '@material-ui/core/DialogActions';
import DialogContent from '@material-ui/core/DialogContent';
import DialogContentText from '@material-ui/core/DialogContentText';
import DialogTitle from '@material-ui/core/DialogTitle';
import { withStyles } from '@material-ui/core/styles';
import moment from 'moment';


const styles = theme => ({});

class CalendarEventModal extends React.Component {
  constructor() {
    super();
    this.state = {
      name: '',
      start: moment(),
      end: moment().add(1, 'day'),
    };
  }

  render() {
    const {
      saveCalendarEvent, calendarEvent, open, closeModal,
    } = this.props;
    const { name, start, end } = this.state;
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
            id="name"
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
            id="name"
            label="End date"
            type="date"
            fullWidth
            InputLabelProps={{
              shrink: true,
            }}
            onChange={e => this.setState({ end: moment(e.target.value) })}
            value={end.format('YYYY-MM-DD')}
          />
        </DialogContent>
        <DialogActions>
          <Button onClick={closeModal} color="primary">Cancel</Button>
          <Button
            onClick={() => {
              saveCalendarEvent({ name, start, end });
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
