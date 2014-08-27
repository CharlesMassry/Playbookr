$(function(){
  $(".medium").on("click", ".new_media_comment", function(){
    var button = $(this);
    dynamicFormFor(button, "medium");
  });

  $(".medium").on("submit", "form", submitComment);
});
