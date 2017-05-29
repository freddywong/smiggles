/* eslint-disable import/prefer-default-export */

import { SMIGGLE_HUNGER_UPDATE } from '../constants/smiggleConstants';

export const updateHunger = (text) => ({
  type: SMIGGLE_HUNGER_UPDATE,
  text,
});
