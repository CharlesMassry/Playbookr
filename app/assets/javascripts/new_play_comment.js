$(function(){
  $(".play").on("click", ".new_play_comment", dynamicFormFor);
  $(".play").on("submit", "form", submitComment);
});
