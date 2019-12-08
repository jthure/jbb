import { connect } from 'react-redux';
import React from 'react';
import { me, login } from '../actions/auth';
import AppBar from '../components/app_bar';
import Calendar from './calendar';


class Base extends React.Component {
  componentWillMount() {
    this.props.me();

    // this.props.login('jthure', 'test');
  }

  render() {
    const {
      loggedIn
    } = this.props;
    return (
      <div>
        <AppBar loggedIn={loggedIn} />
        {loggedIn ? <Calendar /> : <div>Unauthorized</div>}
      </div>
    );
  }
}

const mapStateToProps = state => ({
  loggedIn: state.auth.loggedIn
});

const actionCreators = {
  me,
  login,
};

export default connect(mapStateToProps, actionCreators)(Base);
