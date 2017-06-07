$(function() {
  interact('.draggable')
  .draggable({
    // enable inertial throwing
    inertia: true,
    // keep the element within the area of it's parent
    // restrict: {
    //   restriction: "parent",
    //   endOnly: true,
    //   elementRect: { top: 0, left: 0, bottom: 1, right: 1 }
    // },
    // enable autoScroll
    autoScroll: true,

    // call this function on every dragmove event
    onmove: dragMoveListener
    // call this function on every dragend event
    // onend: function (event) {
    //   var textEl = event.target.querySelector('p');

    //   textEl && (textEl.textContent =
    //     'moved a distance of '
    //     + (Math.sqrt(event.dx * event.dx +
    //                  event.dy * event.dy)|0) + 'px');
    // }
  });

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

    // // listen for drop related events:

    // ondropactivate: function (event) {
      // add active dropzone feedback
      // event.target.classList.add('drop-active');

    // },

    // ondragenter: function (event) {
    //   var draggableElement = event.relatedTarget,
    //       dropzoneElement = event.target;

    //   // feedback the possibility of a drop
    //   dropzoneElement.classList.add('drop-target');
    //   draggableElement.classList.add('can-drop');
    //   draggableElement.textContent = 'Dragged in';
    // },
    // ondragleave: function (event) {
    //   // remove the drop feedback style
    //   event.target.classList.remove('drop-target');
    //   event.relatedTarget.classList.remove('can-drop');
    //   event.relatedTarget.textContent = 'Dragged out';
    // },
    ondrop: dropItemFeedback

    // ondropdeactivate: function (event) {
    //   // remove active dropzone feedback
    //   event.target.classList.remove('drop-active');
    //   event.target.classList.remove('drop-target');
    // }
  });

  interact('#trash_can').dropzone({
    accept: itemId,
    overlap: 0.75,
    ondrop: dropItemFeedback
  });

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
    var itemType = event.relatedTarget.id;
    var dropzoneType = event.target.id;
    sendItem(itemType, dropzoneType)    
  }

  function itemResponder(itemType, preparedDropzoneType) {
    switch(preparedDropzoneType) {
      case "trash_can":
        removeItem(itemType);
        break;
      default:
        resetItem(itemType)
    }
  }

  function removeItem(itemType) {
    $('#' + itemType).remove()
  }

  function resetItem(itemType) {
    var originalItem = $('#' + itemType)
    originalItem.get(0).style.webkitTransform =
    originalItem.get(0).style.transform =
      'translate(0px, 0px)';
    originalItem.get(0).setAttribute('data-x', 0);
    originalItem.get(0).setAttribute('data-y', 0);
  }

  function sendItem(itemType, dropzoneType) {
    var preparedItemType = prepareData(itemType)
    var preparedDropzoneType = prepareData(dropzoneType)
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
      itemResponder(itemType, preparedDropzoneType)
    });    
  }
});
