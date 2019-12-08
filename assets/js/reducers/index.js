import { combineReducers } from 'redux';
import calendar from './calendar';
import ui from './ui';
import auth from './auth';

export default combineReducers({
  calendar,
  ui,
  auth,
});
