// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
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
