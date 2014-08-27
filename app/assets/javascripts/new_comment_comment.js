$(function(){
  $(".comment").on("click", ".new_comment_comment", dynamicFormFor);
  $(".comment").on("submit", "form", submitComment);
});
