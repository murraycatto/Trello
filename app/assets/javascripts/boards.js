$(document).on('turbolinks:load', function() {
  initDraggableCards();
});

function initDraggableCards() {
  $(".card-item-holder").draggable({
    containment: $('.lists-container'),
    helper: 'clone',
    appendTo: $('.lists-container'),
    revert: "invalid",
    start: function(event, ui) {
      $($(event)['0'].currentTarget).addClass('grayed-out');
      $($(ui)['0']['helper']['0']).addClass('dragging');
    },
    stop: function(event, ui) {
      $($(event)['0'].target).removeClass('grayed-out');
    }
  });
  $(".list-item-holder").droppable({
    drop: function(event, ui) {
      moveCardToList($(event)['0']['target'], $(ui)['0']['draggable']['0']);
    },
    hoverClass: "drop-hover"
  });
}

function moveCardToList(list, card) {
  ListID = $(list).data('id');
  CardID = $(card).data('id');
  $("#CardListID" + CardID).val(ListID);
  $(list).find(".cards-holder").append(card);
  $.ajax({
    method: "PUT",
    url: "/cards/" + CardID + "/update_list",
    data: {
      list_id: ListID,
      authenticity_token: authenticity_token
    }
  }).done(function(data) {
    // TODO: IF it fails roll back move
    console.log(data);
  });
}

function changeCardName(CardID, Name) {
  $("#CardName" + CardID).html(Name);
  $.ajax({
    method: "PUT",
    url: "/cards/" + CardID,
    data: {
      name: Name,
      authenticity_token: authenticity_token
    }
  }).done(function(data) {
    // TODO: IF it fails roll back name
    console.log(data);
  });
}
