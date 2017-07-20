function convertProgress(progress) {
  return progress / 100
}

function lifeProgressBar(progress) {
  var progress = convertProgress(progress);
  $('#life-progress > svg').remove();

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

function itemProgressBar(progress, progressType) {
  var progress = convertProgress(progress);
  $('#' + progressType + "> svg").remove();
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

function updateProgressBar(progress, bar) {
  var progress = convertProgress(progress);
  bar.animate(progress)
}

function foodProgressBar(progress) {
  return itemProgressBar(progress, 'food-progress')
}

function drinkProgressBar(progress) {
  return itemProgressBar(progress, 'drink-progress')
}

function happinessProgressBar(progress) {
  return itemProgressBar(progress, 'happiness-progress') 
}