function showDefaultFace(defaultFace, faceElement) {
  var faceId = faceElement.attr('id');
  if(defaultFace === faceId) {
    faceElement.show();
  }
}
