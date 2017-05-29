import PropTypes from 'prop-types';
import React from 'react';
import smigglesGif from 'assets/gifs/large-smile.gif';
import foodImage from 'assets/images/fish.png';

const Smiggle = ({ updateHunger }) => (
  <div>
    <img src={smigglesGif} />
    <hr />
    <input type="image" src={foodImage} onClick={(e) => updateHunger(e.target.value)} />
      
    
  </div>
);

Smiggle.propTypes = {
  hunger: PropTypes.string.isRequired,
  updateHunger: PropTypes.func.isRequired,
};

export default Smiggle;
