function getEditLabel(LabelID) {
  $.ajax({
    method: "GET",
    url: "/labels/" + LabelID + "/edit"
  }).done(function(data) {
    $(".label-form-holder").hide();
    $(".label-edit-form-holder").show();
    $(".label-edit-form-holder").html(data);
  });
}

function selectLabelColor(ColorID){
  $('.color-item .icon-check').hide();
  $('#LabelColor'+ColorID+ ' .icon-check').show();
  $('#LabelColorID').val(ColorID);
}

function updateLabelColors(LabelID,HexCode) {
  console.log(LabelID);
  console.log(HexCode);
  $(".label-item"+LabelID).each(function(i,el){
    console.log($(el));
    $(el).css('background',HexCode);
  });
  $(".label-edit-form-holder .small-modal-back-button").click();
}
