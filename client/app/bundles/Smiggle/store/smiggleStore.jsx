import { createStore } from 'redux';
import smiggleReducer from '../reducers/smiggleReducer';

const configureStore = (railsProps) => (
  createStore(smiggleReducer, railsProps)
);

export default configureStore;
