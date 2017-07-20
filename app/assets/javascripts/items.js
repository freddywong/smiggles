$(function() {
  interact('.draggable')
  .draggable({
    inertia: true,
    autoScroll: true,
    onmove: dragMoveListener
  })

  function dragMoveListener (event) {
    var target = event.target,
        // keep the dragged position in the data-x/data-y attributes
        x = (parseFloat(target.getAttribute('data-x')) || 0) + event.dx,
        y = (parseFloat(target.getAttribute('data-y')) || 0) + event.dy;

    // translate the element
    target.style.webkitTransform =
    target.style.transform =
      'translate(' + x + 'px, ' + y + 'px)';

    // update the posiion attributes
    target.setAttribute('data-x', x);
    target.setAttribute('data-y', y);
  }

  interact('.face').dropzone({
    // only accept elements matching this CSS selector
    accept: itemId,
    // Require a 75% element overlap for a drop to be possible
    overlap: 0.75,
    ondrop: dropItemFeedback
  });

  interact('#trash_can').dropzone({
    accept: itemId,
    overlap: 0.75,
    ondrop: dropItemFeedback
  });

  var itemType;
  var dropzoneType;
  var preparedItemType;
  var preparedDropzoneType;

  function prepareData(type) {
    var selector = $("#" + type);
    if(selector[0].classList.contains("face")) {
      return "face";
    } else if (selector[0].classList.contains("waste")) {
      return "waste";
    } else {
      return type;
    }
  }

  function itemId(event) {
    return '#' + event.relatedTarget.id
  }

  function dropItemFeedback(event) {
    itemType = event.relatedTarget.id;
    dropzoneType = event.target.id;
    preparedItemType = prepareData(itemType);
    preparedDropzoneType = prepareData(dropzoneType);

    sendItem()    
  }

  function resetItem() {
    var originalItem = $('#' + itemType)
    originalItem.get(0).style.webkitTransform =
    originalItem.get(0).style.transform =
      'translate(0px, 0px)';
    originalItem.get(0).setAttribute('data-x', 0);
    originalItem.get(0).setAttribute('data-y', 0);
  }  

  function sendItem() {
    var smiggleId = $(".smiggle").data('id')
    $.ajax({
      url: "/smiggles/" + smiggleId,
      method: 'patch',
      data: { 
        smiggle: {
          item: preparedItemType,
          dropzone: preparedDropzoneType
        }
      }
    }).done(function() {
      console.log('Updated ' + itemType)
      itemResponder()
    });    
  }

  function itemResponder() {
    switch(preparedDropzoneType) {
      case "trash_can":
        itemToTrashCan();
        break;
      default:
        resetItem();
    }
  }

  function itemToTrashCan() {
    var dropzone = $('#' + dropzoneType)
    dropzone.animateCss('rubberBand');
    switch(preparedItemType) {
      case "waste":
        $('#' + itemType).remove()
        break;
      default: 
        resetItem(itemType)  
    }
  }
});
