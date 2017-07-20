function showTrashCan(wasteCount, lifeAmount) {
  if((wasteCount > 0) && (lifeAmount !== '0')){
    $('#trash_can').css('display', 'block');
  } else {
    $('#trash_can').fadeOut();
  }
}
