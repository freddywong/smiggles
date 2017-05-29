import { combineReducers } from 'redux';
import { SMIGGLE_HUNGER_UPDATE } from '../constants/smiggleConstants';

const hunger = (state = '', action) => {
  switch (action.type) {
    case SMIGGLE_HUNGER_UPDATE:
      return action.text;
    default:
      return state;
  }
};

const smiggleReducer = combineReducers({ hunger });

export default smiggleReducer;
