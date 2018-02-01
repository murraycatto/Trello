//= require jquery
//= require jquery-ui
//= require rails-ujs
//= require turbolinks
//= require_tree .


$(document).on('turbolinks:load', function() {
  initHideOnBodyClick();
});

function initHideOnBodyClick(){
  $('body').click(function(event){
    // Show hide body clicks
    if (!$(event.target).hasClass("hide-body-clicks-btn") && $(event.target).parents(".hide-body-clicks").length === 0 && $(event.target).parents(".hide-body-clicks-btn").length === 0)
    {
        $(".hide-body-clicks").hide();
    }
    if(!$(event.target).hasClass("stop-show-body-clicks") && $(event.target).parents(".stop-show-body-clicks").length === 0 && !$(event.target).hasClass("show-body-clicks")){
        $(".show-body-clicks").show();
    }
    // Show hide body clicks

    if($(this).hasClass("modal-visible")){
      // Dismiss modal
      if($(event.target).parents(".modal-holder").length === 0 && !$(event.target).hasClass("modal-holder")){
        dismissModals();
      }
    }

  });
}


function dynamicAjaxGet(PathName,ReplaceHolder,callBacks){

  if(callBacks === undefined){
	    callBacks = '';
	}

	$.ajax({
		method: "Get",
		url: PathName
	}) .done(function( data ) {
			$("#"+ReplaceHolder)['0'].innerHTML = data;
			eval(callBacks);
			eval($(data).find("script").text());
	});
	return false;
}

function showModals(){
  $("#ModalHolder").show();
  $("body").addClass('modal-visible');
  $("#ModalOverlay").addClass("active");
}

function dismissModals(){
  $("#ModalHolder").hide();
  $("body").removeClass('modal-visible');
  $("#ModalOverlay").removeClass("active");
}
