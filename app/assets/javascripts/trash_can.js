function showTrashCan(waste_count) {
  if(waste_count > 0){
    $('#trash_can').css('display', 'block');
  } else {
    $('#trash_can').fadeOut();
  }
}
