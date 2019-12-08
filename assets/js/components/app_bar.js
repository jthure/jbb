import React from 'react';
import AppBar from '@material-ui/core/AppBar';
import Toolbar from '@material-ui/core/Toolbar';
import Typography from '@material-ui/core/Typography';
import Button from '@material-ui/core/Button';
import IconButton from '@material-ui/core/IconButton';
import MenuIcon from '@material-ui/icons/Menu';
import { withStyles } from '@material-ui/core/styles';

const styles = theme => ({
  root: {
    flexGrow: '1',
  },
  grow: {
    flexGrow: '1',
  },
});

const JBBAppBar = ({ classes, loggedIn }) => (
  <div className={classes.root}>
    <AppBar position="static">
      <Toolbar>
        <IconButton color="inherit" aria-label="Menu">
          <MenuIcon />
        </IconButton>
        <Typography variant="h6" color="inherit" className={classes.grow}>JBB</Typography>
        <Button color="inherit">{loggedIn ? "Logout" : "Login"}</Button>
      </Toolbar>
    </AppBar>
  </div>
);

export default withStyles(styles)(JBBAppBar);
