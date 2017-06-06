function showDefaultFace(defaultFace, faceElement) {
  var faceId = faceElement.attr('id');
  if(defaultFace === faceId) {
    faceElement.show();
  }
}

function showUpdatedFace(updatedFace) {
  var face = $("#" + updatedFace)
  face.fadeIn("slow")
}

function showReactionFace(reactionFace, updatedFace) {
  var face = $("#" + reactionFace)
  face.show();

  setTimeout(function(){
    face.hide();
    showUpdatedFace(updatedFace)
  }, 5000);
}
