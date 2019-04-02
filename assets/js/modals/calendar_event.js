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
      startDate: moment(),
      endDate: moment().add(1, 'day'),
    };
  }

  render() {
    const {
      handleSubmit, calendarEvent, open, closeModal,
    } = this.props;
    const { startDate, endDate } = this.state;
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
            onChange={e => this.setState({ startDate: moment(e.target.value) })}
            value={startDate.format('YYYY-MM-DD')}
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
            onChange={e => this.setState({ endDate: moment(e.target.value) })}
            value={endDate.format('YYYY-MM-DD')}
          />
        </DialogContent>
        <DialogActions>
          <Button onClick={closeModal} color="primary">Cancel</Button>
          <Button onClick={handleSubmit} color="primary">Save</Button>
        </DialogActions>
      </Dialog>
    );
  }
}

export default withStyles(styles)(CalendarEventModal);
