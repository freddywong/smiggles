function generateRandom() {
  var windowWidth = $(window).width() - 40;
  return Math.floor(Math.random()*windowWidth);
}

function selectContainer() {
  var containers = $(".waste-container").get();
  var selector = Math.floor(Math.random() * containers.length);
  return $(".waste-container").eq(selector)
}

function appendWaste(i, container, waste_image_path) {
  count = i + 1;
  container.append("<img src=" + waste_image_path + " alt='Waste' id='waste-" + count + "' class='draggable item waste'/>");
  var left = generateRandom();
  $("#waste-" + count).css({"position":"absolute", "left": left + "px"});
}

function showWaste(waste_count, waste_image_path) {
  for(var i = 0; i < waste_count; i++) {
    container = selectContainer();
    appendWaste(i, container, waste_image_path);
  }  
}

function clearWaste(){
  $('.waste-container').empty();
}