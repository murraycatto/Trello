function toggleChecklistItemStatus(ChecklistItemID) {
  $.ajax({
    method: "GET",
    url: "/toggle_checklist_item_status/" + ChecklistItemID + ".json"
  }).done(function(data) {
    $("#ChecklistItem" + ChecklistItemID).removeClass("complete");
    $("#ChecklistItem" + ChecklistItemID).removeClass("incomplete");
    $("#ChecklistItem" + ChecklistItemID).addClass(data.checklist_item_status);
    updateChecklistPercentage(data.checklist_id, data.complete_percentage, data.checklist_complete);
  });
}

function updateChecklistPercentage(ChecklistID, CompletePercentage, ChecklistComplete) {
  $("#CheckListPercentagesHolder" + ChecklistID).removeClass("complete");
  if (ChecklistComplete) {
    $("#CheckListPercentagesHolder" + ChecklistID).addClass("complete");
  }
  $("#CheckListPercentagesHolder" + ChecklistID + " span").html(CompletePercentage + "%");
  $("#CheckListPercentagesHolder" + ChecklistID + " .checklist-progress").css({
    "width": CompletePercentage + "%"
  });
}
