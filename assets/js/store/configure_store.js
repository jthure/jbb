import { createStore, applyMiddleware } from 'redux';
import thunk from 'redux-thunk';
import { createLogger } from 'redux-logger';
import promise from 'redux-promise';
import { composeWithDevTools } from 'redux-devtools-extension';
import allReducers from '../reducers';

const logger = createLogger();

export default function configureStore(initialState) {
  return createStore(
    allReducers,
    initialState,
    composeWithDevTools(
      applyMiddleware(thunk, logger, promise),
    ),
  );
}
