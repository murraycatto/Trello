//= require rails-ujs
//= require turbolinks
//= require jquery
//= require_tree .


$(document).on('turbolinks:load', function() {
  initHideOnBodyClick();
});

function initHideOnBodyClick(){
  $('body').click(function(event){
    if (!$(event.target).hasClass("hide-body-clicks-btn") && $(event.target).parents(".hide-body-clicks").length === 0 && $(event.target).parents(".hide-body-clicks-btn").length === 0)
    {
        $(".hide-body-clicks").hide();
    }
    if(!$(event.target).hasClass("stop-show-body-clicks") && $(event.target).parents(".stop-show-body-clicks").length === 0 && !$(event.target).hasClass("show-body-clicks")){
        $(".show-body-clicks").show();
    }
  });
}
