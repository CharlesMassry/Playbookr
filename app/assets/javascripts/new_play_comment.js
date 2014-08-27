$(function(){
  $(".play").on("click", ".new_play_comment", function(){
    var button = $(this);
    dynamicFormFor(button, "play");
  });

  $(".play").on("submit", "form", submitComment);
});
