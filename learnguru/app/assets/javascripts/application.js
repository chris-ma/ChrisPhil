// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require cocoon
//= require_tree .

$(function () {

  var learnboxtemplate = Handlebars.compile($("#entry-template").html());

  $("#new-learnlist-button").click(function () {

    // create function to build lesson box
    // create function to create learnlist
      var newlearnlistname = $("#new-learnlist-name").val();
      var newlearnlisttitle = {name: newlearnlistname, body: "This is my first lesson"};
      $("#learnlist-content").html(learnboxtemplate(newlearnlisttitle));
      event.preventDefault();
      $("#new-learnlist-input").hide();
      $.ajax({
        method: "POST",
        url: "/learnlists",
        dataType: "json",
        data: {
          learnlist: {
            name: newlearnlistname,
            status: 'draft' }
          },
          success: function (data) {
            console.log("response"+data.id);
            $("#learnlist-content").data("id",data.id).attr("id","ll"+data.id);
          }
        })


  $("#new-lesson-button").on("click", function () { 
    var lessonurl = $("#provider").val();
    console.log("new lesson");
        $.ajax({
        method: "POST",
        url: "/lessons",
        dataType: "json",
        data: {
          lesson: {
            provider_url: lessonurl}
          },
          success: function (data) {
            console.log("response"+data.id);
            console.log("response"+data.title);
            // $("#learnlist-content").data("id",data.id).attr("id","ll"+data.id);
          }
        })
      });
    });

});






