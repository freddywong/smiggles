function convertProgress(progress) {
  return progress / 100
}

function lifeProgress(progress) {
  var progress = convertProgress(progress);
  var bar = new ProgressBar.Circle('#life-progress', {
    strokeWidth: 10,
    easing: 'easeInOut',
    duration: 1400,
    color: '#FFEA82',
    from: {color: '#ED6A5A', a:0},
    to: {color: '#3AC162', a:1},
    step: function(state, circle) {
      circle.path.setAttribute('stroke', state.color);
    }
  });
  bar.animate(progress);

  return bar
}

function itemProgress(progress, progressType) {
  var progress = convertProgress(progress);
  var bar = new ProgressBar.Circle('#' + progressType, {

    color: '#FFEA82',
    trailColor: '#eee',
    duration: 1400,
    easing: 'bounce',
    strokeWidth: 6,
    from: {color: '#ED6A5A', a:0},
    to: {color: '#3AC162', a:1},
    // Set default step function for all animate calls
    step: function(state, circle) {
      circle.path.setAttribute('stroke', state.color);
    }
  });

  bar.animate(progress);

  return bar
}

function updateProgress(progress, bar) {
  var progress = convertProgress(progress);
  bar.animate(progress)
}

function foodProgress(progress, progressType) {
  return itemProgress(progress, progressType)
}

function drinkProgress(progress, progressType) {
  return itemProgress(progress, progressType)
}

function happinessProgress(progress, progressType) {
  return itemProgress(progress, progressType) 
}