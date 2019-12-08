import { combineReducers } from 'redux';
import calendar from './calendar';
import ui from './ui';

export default combineReducers({
  calendar,
  ui,
});
