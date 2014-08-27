$(function(){
  $(".medium").on("click", ".new_media_comment", dynamicFormFor);
  $(".medium").on("submit", "form", submitComment);
});
