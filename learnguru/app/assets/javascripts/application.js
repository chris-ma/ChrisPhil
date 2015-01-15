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


  var createNewLearnList = function () {

    var newlearnlistname = $("#new-learnlist-name").val();
    var newlearnlisttitle = {name: newlearnlistname};

    console.log("function");
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
         $("#new-learnlist-input").hide();
         var learnlisttitletemplate = Handlebars.compile($("#learnlisttitle-template").html());
         $("#learnlist-content").html(learnlisttitletemplate(newlearnlisttitle));
         $("#learnlist-content").data("id",data.id);
       }
     })
  }

  $("#new-learnlist-name").on("keypress", function (event) {
    if (event.keyCode === 13 && $(this).val() !== "") {
      event.preventDefault();  
      console.log("enter");
      createNewLearnList();
    }
  });
  
  $("#new-learnlist-button").click(function () {
    event.preventDefault();  
    console.log("button");
    createNewLearnList();
  });

  $("body").on("click", "#find-lesson-button", function () { 
    var lessonurl = $("#new-provider").val();
    var learnlistID = $("#learnlist-content").data("id");
    console.log(learnlistID);
    console.log(lessonurl);
    $.ajax({
      method: "POST",
      url: "/lessons",
      dataType: "json",
      data: {
        lesson: {
          provider_url: lessonurl,
          learnlist_ids: [learnlistID]
        }
      },
      success: function (data) {
        newlessondata = {
          title: data.title,
          description: data.description,
          thumbnail_url: data.thumbnail_url,
          provider_url: data.provider_url
        }
        if (data.provider_name === 'undefined') {
          console.log("undef");
          newlessondata.provider_name = data.provider_url}
          else {newlessondata.provider_name = data.provider_url}
            console.log(newlessondata);
          var lessontemplate = Handlebars.compile($("#lessoninfo-template" ).html());  

          $("#lesson-container-new").data("id",data.id).attr("id","lesson-container-last");
          $("#mediabox-new").attr("id","mediabox-last");
          $("#mediabox-last").html(data.html);
          $("#mediaInfo-last").html(lessontemplate(newlessondata));
          $(".lessonControl").css("display","block");
        }
      })
});


$("body").on("click", "#keep-lesson-button", function () { 
  console.log('keep');
  var lessoncontainertemplate = $("#lessoncontainer-template").html();
  var lessonsummarytemplate = Handlebars.compile($("#lessonsummary-template").html());


  $("#lesson-container-last").html(lessonsummarytemplate(newlessondata));
  $("#lesson-container-last").after(lessoncontainertemplate);
  $("#lesson-container-last").attr("id","lesson-container");
  $("#mediabox-last").attr("id","mediabox");

});

$("body").on("click", "#delete-lesson-button", function () { 
     console.log('delete');
     var lessoncontainertemplate = $("#lessoncontainer-template").html();
     console.log(lessoncontainertemplate);
     var lessonID =  $("#lesson-container-last").data("id");
 $.ajax({
    method: "POST",
    url: "/lessons/" + lessonID,
    dataType: "json",
      data: {
        _method: "DELETE"
      },
    success: function (data) {
      $("#lesson-container-last").html(lessoncontainertemplate);
      $("#lesson-container-last").attr("id","lesson-container-new");
    }
  })
});

$("body").on("click", "#finished-learnlist-button", function () { 
     console.log('finished');
     var learnlistID = $("#learnlist-content").data("id");
 $.ajax({
      method: "PUT",
      url: "/learnlists/" + learnlistID,
      dataType: "json",
      data: {
        _method: "PATCH",
        learnlist: {
          status: 'complete'}
        },
        success: function (data) {
          console.log('updated');
         // $("#new-learnlist-input").hide();
         // var learnlisttitletemplate = Handlebars.compile($("#learnlisttitle-template").html());
         // $("#learnlist-content").html(learnlisttitletemplate(newlearnlisttitle));
         // $("#learnlist-content").data("id",data.id);
       }
     })
});



});















